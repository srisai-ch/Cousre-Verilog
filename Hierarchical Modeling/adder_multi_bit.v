`include "full_adder_gate.v"
module adder#(
    parameter WIDTH = 12
)(
    input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,
    input Cin,
    output [WIDTH-1:0] Sum,
    output Cout
);

wire [WIDTH:0] carry;

genvar i;
assign carry[0] = Cin;
generate
    for(i=0; i<WIDTH; i=i+1) begin : adder_loop
        full_adder FA (
            .a(A[i]),
            .b(B[i]),
            .ci(carry[i]),
            .s(Sum[i]),
            .co(carry[i+1])
        );
    end
endgenerate
assign Cout = carry[WIDTH];
endmodule
