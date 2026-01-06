module full_adder(
    input a,
    input b,
    input ci,
    output reg s,
    output reg co
);

always @(*) begin
    s = a ^ b ^ ci;
    co = (a&b) | (b&ci) | (ci&a);
end

endmodule