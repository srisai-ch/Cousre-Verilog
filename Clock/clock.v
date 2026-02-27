`timescale 1ns/1ns
module tb;
parameter TP = 10;
reg clk;

initial begin
    clk = 0;
    forever #(TP/2.0) clk = ~clk;
end

initial begin
    #200; 
    $finish;
end

endmodule