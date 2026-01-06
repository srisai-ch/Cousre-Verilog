`include "half_adder_gate.v"

module tb;

reg p,q;
wire s,c;

half_adder dut(p,q,s,c);

initial begin

repeat(12) begin
    p = $random;
    q = $random;
    #1;
    $display("%t - a = %b, b = %b, sum = %b, carry = %b",$time, p, q, s, c);
end

end
endmodule