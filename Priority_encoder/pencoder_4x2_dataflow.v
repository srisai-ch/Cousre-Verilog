module pencoder_4x2_dataflow (
    input [3:0] in,
    output [1:0] out,
    output valid
);

    assign out[1] = in[3] | in[2];
    assign out[0] = in[3] | (in[1] & ~in[2]);
    assign valid = |in;

endmodule