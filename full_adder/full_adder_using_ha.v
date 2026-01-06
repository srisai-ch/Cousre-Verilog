//`include "half_adder_gate.v"

module full_adder(
    input a,
    input b,
    input c_in,
    output sum,
    output carry
);

wire n1, n2, n3;

half_adder u0(.a(a),.b(b),.sum(n1),.carry(n2));
half_adder u1(.a(c_in),.b(n1),.sum(sum),.carry(n3));
or (carry,n2,n3);

endmodule