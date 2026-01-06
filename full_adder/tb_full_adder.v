//`include "full_adder_using_ha.v"

module tb;

reg a, b, ci;
wire s, co;
integer seed;

full_adder dut(a,b,ci,s,co);

initial begin
   
   seed = 42345;
   repeat(15) begin
    a = $random(seed);
    b = $random(seed);
    ci = $random(seed);
    #1;
    $display("%0t - a = %b, b = %b, ci = %b, sum = %b, carryout = %b", $time, a, b, ci, s, co);
   
   end 
end

endmodule