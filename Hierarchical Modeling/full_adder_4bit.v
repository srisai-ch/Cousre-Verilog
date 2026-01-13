`include "full_adder_gate.v"
module full_adder_4bit(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

full_adder u0(
    .a(A[0]),
    .b(B[0]),
    .ci(Cin),
    .s(Sum[0]),
    .co(c1)
);

full_adder u1(
    .a(A[1]),
    .b(B[1]),
    .ci(c1),
    .s(Sum[1]),
    .co(c2)
);

full_adder u2(
    .a(A[2]),
    .b(B[2]),
    .ci(c2),
    .s(Sum[2]),
    .co(c3)
);


full_adder u3(
    .a(A[3]),
    .b(B[3]),
    .ci(c3),
    .s(Sum[3]),
    .co(Cout)
);


endmodule