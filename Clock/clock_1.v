`timescale 1ns/10ps

module tb;
reg clk;
real freq;
real TP;

initial begin
    $value$plusargs("freq=%d", freq);
    TP = 1000/freq;
    clk = 0;
    forever #(TP/2.0) clk = ~clk;
end

initial begin
    #200; 
    $finish;
end

endmodule