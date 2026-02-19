module tb_seq_1011_moore;
    reg clk;
    reg rst;
    reg x;
    wire y;

    reg [3:0] hist;
    integer errors;

    seq_1011_moore dut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    task send_bit(input reg bit_in);
        reg [3:0] next_hist;
        reg expected;
        begin
            x = bit_in;
            @(posedge clk);
            next_hist = {hist[2:0], bit_in};
            hist = next_hist;
            expected = (next_hist == 4'b1011);
            #1;
            if (y !== expected) begin
                $display("ERROR t=%0t bit=%0b hist=%b expected_y=%0b got_y=%0b", $time, bit_in, next_hist, expected, y);
                errors = errors + 1;
            end else begin
                $display("OK    t=%0t bit=%0b hist=%b y=%0b", $time, bit_in, next_hist, y);
            end
        end
    endtask

    initial begin
        errors = 0;
        hist = 4'b0000;
        x = 1'b0;
        rst = 1'b1;

        repeat (2) @(posedge clk);
        rst = 1'b0;

        // Sequence with one 1011 detection
        send_bit(1'b1);
        send_bit(1'b0);
        send_bit(1'b1);
        send_bit(1'b1);

        // Overlapping detections in 1011011
        send_bit(1'b0);
        send_bit(1'b1);
        send_bit(1'b1);

        // Noise bits
        send_bit(1'b0);
        send_bit(1'b0);
        send_bit(1'b1);

        if (errors == 0) $display("TEST PASSED");
        else             $display("TEST FAILED: %0d mismatches", errors);

        $finish;
    end
endmodule
