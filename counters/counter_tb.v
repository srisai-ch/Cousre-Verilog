`timescale 1ns/1ps

module counter_tb;

    reg clk;
    reg rst_n;
    reg en;
    reg up;

    wire [7:0] up_count;
    wire [7:0] down_count;
    wire [7:0] up_down_count;
    wire [7:0] mod_count;
    wire       mod_tc;
    wire [3:0] bcd_count;
    wire       bcd_tc;
    wire [7:0] gray_count;
    wire [7:0] ring_count;
    wire [7:0] johnson_count;

    counter_up_sync #(.WIDTH(8)) u_counter_up_sync (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .count(up_count)
    );

    counter_down_sync #(.WIDTH(8)) u_counter_down_sync (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .count(down_count)
    );

    counter_up_down #(.WIDTH(8)) u_counter_up_down (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .up(up),
        .count(up_down_count)
    );

    counter_mod_n #(
        .WIDTH(8),
        .MOD_VALUE(10)
    ) u_counter_mod_n (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .count(mod_count),
        .tc(mod_tc)
    );

    counter_bcd_decade u_counter_bcd_decade (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .bcd(bcd_count),
        .tc(bcd_tc)
    );

    counter_gray #(.WIDTH(8)) u_counter_gray (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .gray_count(gray_count)
    );

    counter_ring #(.WIDTH(8)) u_counter_ring (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .ring(ring_count)
    );

    counter_johnson #(.WIDTH(8)) u_counter_johnson (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .johnson(johnson_count)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 1'b0;
        en    = 1'b0;
        up    = 1'b1;

        #20;
        rst_n = 1'b1;
        en    = 1'b1;

        repeat (20) @(posedge clk);

        up = 1'b0;
        repeat (12) @(posedge clk);

        en = 1'b0;
        repeat (5) @(posedge clk);

        en = 1'b1;
        up = 1'b1;
        repeat (16) @(posedge clk);

        $finish;
    end

    initial begin
        $monitor("T=%0t | up=%0d down=%0d updn=%0d mod=%0d mod_tc=%b bcd=%0d bcd_tc=%b gray=%b ring=%b john=%b",
                 $time, up_count, down_count, up_down_count, mod_count, mod_tc, bcd_count, bcd_tc, gray_count, ring_count, johnson_count);
    end

endmodule
