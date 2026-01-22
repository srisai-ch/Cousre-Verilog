`include "adder_multi_bit.v"

module tb;

parameter WIDTH = 6;
reg [WIDTH-1:0] a, b;
reg cin;
wire [WIDTH-1:0] s;
wire co;
integer seed;

adder dut(.A(a),.B(b),.Cin(cin),.Sum(s),.Cout(co));

initial begin
   
   seed = 42345;
   repeat(15) begin
    {a,b,cin} = $random(seed);
    #1;
    $display("%0t - a = %d, b = %d, ci = %b, sum = %d, carryout = %b, total = %d", $time, a, b, cin, s, co, {co, s});
   
   end 
end

endmodule