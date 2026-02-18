`timescale 1ns/1ps

module tb_arbiter;
    reg         clk;
    reg         rst_n;
    reg  [31:0] req;
    reg  [127:0] qos;
    wire [31:0] grant;
    wire        grant_valid;
    wire [4:0]  grant_idx;

    integer errors;

    qos_arbiter_32 dut (
        .clk(clk),
        .rst_n(rst_n),
        .req(req),
        .qos(qos),
        .grant(grant),
        .grant_valid(grant_valid),
        .grant_idx(grant_idx)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    task clear_qos;
        begin
            qos = 128'd0;
        end
    endtask

    task set_qos;
        input integer idx;
        input [3:0] val;
        begin
            qos[(idx*4) +: 4] = val;
        end
    endtask

    task expect_grant;
        input exp_valid;
        input [4:0] exp_idx;
        reg [31:0] exp_grant;
        begin
            exp_grant = 32'd0;
            if (exp_valid)
                exp_grant = (32'd1 << exp_idx);

            #1;
            if (grant_valid !== exp_valid) begin
                $display("ERROR t=%0t: grant_valid exp=%0b got=%0b", $time, exp_valid, grant_valid);
                errors = errors + 1;
            end

            if (grant !== exp_grant) begin
                $display("ERROR t=%0t: grant exp=%h got=%h", $time, exp_grant, grant);
                errors = errors + 1;
            end

            if (exp_valid && (grant_idx !== exp_idx)) begin
                $display("ERROR t=%0t: grant_idx exp=%0d got=%0d", $time, exp_idx, grant_idx);
                errors = errors + 1;
            end
        end
    endtask

    task step_clock;
        begin
            @(posedge clk);
            #1;
        end
    endtask

    initial begin
        errors = 0;
        req    = 32'd0;
        clear_qos();

        rst_n = 1'b0;
        step_clock();
        rst_n = 1'b1;

        // No request -> no grant.
        req = 32'd0;
        clear_qos();
        expect_grant(1'b0, 5'd0);

        // Single request.
        req = 32'd0;
        clear_qos();
        req[3] = 1'b1;
        set_qos(3, 4'd5);
        expect_grant(1'b1, 5'd3);
        step_clock();

        // Highest QoS wins.
        req = 32'd0;
        clear_qos();
        req[1] = 1'b1; set_qos(1, 4'd2);
        req[4] = 1'b1; set_qos(4, 4'd3);
        req[7] = 1'b1; set_qos(7, 4'd9);
        expect_grant(1'b1, 5'd7);
        step_clock();

        // Tie on QoS, round-robin from rr_ptr=8 selects 10 before 2.
        req = 32'd0;
        clear_qos();
        req[2]  = 1'b1; set_qos(2, 4'd12);
        req[10] = 1'b1; set_qos(10, 4'd12);
        expect_grant(1'b1, 5'd10);
        step_clock();

        // Next tie winner rotates to 2.
        expect_grant(1'b1, 5'd2);
        step_clock();

        // Wrap-around check: rr_ptr=3, tie between 31 and 0 should pick 31 first.
        req = 32'd0;
        clear_qos();
        req[0]  = 1'b1; set_qos(0, 4'd15);
        req[31] = 1'b1; set_qos(31, 4'd15);
        expect_grant(1'b1, 5'd31);
        step_clock();

        // After pointer update, same tie should pick 0.
        expect_grant(1'b1, 5'd0);
        step_clock();

        if (errors == 0)
            $display("PASS: All QoS arbiter checks passed.");
        else
            $display("FAIL: %0d checks failed.", errors);

        $finish;
    end

endmodule
