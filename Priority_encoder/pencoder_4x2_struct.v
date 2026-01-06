module pencoder_4x2_struct (
    input [3:0] in,
    output [1:0] out,
    output valid
);
    wire n1;
    or (out[1], in[3], in[2]);
    and (n1, in[1], ~in[2]);
    or (out[0], in[3], n1);

    or (valid, in[3], in[2], in[1], in[0]);

endmodule