module mux_4x1(
    input [3:0] i,
    input [1:0] sel,
    output out
);

assign out = (sel == 2'b00)? i[0]:
             (sel == 2'b01)? i[1]:
             (sel == 2'b10)? i[2]:
             (sel == 2'b11)? i[3]: 1'bx;

endmodule
