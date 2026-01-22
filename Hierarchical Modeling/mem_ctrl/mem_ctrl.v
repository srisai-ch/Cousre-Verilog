module mem_ctrl(
    input p1, p2, p3, p4, p5,
    output q1, q2, q3, q4, q5, q6
)

wire n1, n2, n3, n4;

addr_gen ag(.i1(p1), .i2(p2), .i3(n3), .o1(q1), .o2(n1), .o3(n2));
data_gen dg(.i1(p3), .i2(p4), .o1(n3), .o2(q6), .o3(n4));
timing_ctrl tg(n1, n2, n4, p5, q2, q4, q3, q5);

endmodule