module full_adder_4bit (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output wire [3:0] Sum,
    output  wire Cout
);

assign {Cout, Sum} = A + B + Cin;

endmodule