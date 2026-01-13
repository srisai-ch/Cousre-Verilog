module full_adder(
    input a,
    input b,
    input ci,
    output s,
    output co
);

wire n1, n2, n3;

xor(n1, a, b);
xor(s, n1, ci);
and(n2, a, b);
and(n3, n1, ci);
or(co, n2, n3);

endmodule