`include "circuit2.v"

module tb;
reg a;
reg b;
reg clk;
reg res;
wire y; 
integer delay;

circuit2 dut (
    .a(a),
    .b(b),
    .clk(clk),
    .res(res),
    .y(y)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    
    res = 1;
    a = 0;
    b = 0;
    repeat(2) @(posedge clk);
    res = 0;
    repeat (20) begin
       {a,b} = $random;
        delay = $urandom_range(5, 15);
        #delay;
    end
    $finish;
end
endmodule