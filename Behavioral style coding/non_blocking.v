`timescale 1ns/1ps

module tb;
reg d;
reg Q1, Q2, Q3;
reg clk;
integer delay;

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

always @(posedge clk) begin
    Q1 <= d;
    Q2 <= Q1;
    Q3 <= Q2;    
end

initial begin
    repeat(10) begin
        d = $random;
        delay = $urandom_range(5, 15);
        #delay;
    end
    $finish;
end

endmodule