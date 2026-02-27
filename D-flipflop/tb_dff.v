`timescale 1ns/1ps
`include "dff_gate.v"
module tb;
reg clk, rst, d;
wire q;

dff dut(clk, rst, d, q);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    d = 0;
    @(posedge clk);
    //#1;
    rst = 0;
    //generate some random inputs
    repeat(20) begin
        d = $random;
        #($urandom_range(5, 20));
    end

    #10;
    $finish;
end


endmodule