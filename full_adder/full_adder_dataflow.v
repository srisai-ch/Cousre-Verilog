module full_adder(
    input a,
    input b,
    input ci,
    output s,
    output co
);

assign s = a ^ b ^ ci;
assign co = (a&b) | (b&ci) | (ci&a);

endmodule