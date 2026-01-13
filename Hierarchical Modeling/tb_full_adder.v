`include "full_adder_4bit_dataflow.v"

module tb;

reg [3:0] a, b;
reg cin;
wire [3:0] s;
wire co;
integer seed;

full_adder_4bit dut(.A(a),.B(b),.Cin(cin),.Sum(s),.Cout(co));

initial begin
   
   seed = 42345;
   repeat(15) begin
    {a,b,cin} = $random(seed);
    #1;
    $display("%0t - a = %b, b = %b, ci = %b, sum = %b, carryout = %b", $time, a, b, cin, s, co);
   
   end 
end

endmodule