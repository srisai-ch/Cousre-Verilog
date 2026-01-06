module pencoder_4x2 (
    input [3:0] in,
    output reg [1:0] out,
    output reg valid
);
    always @(*) begin
        valid = 1;
        out = 2'bxx;
        casex (in)
            4'b0001 : out = 2'b00;
            4'b001x : out = 2'b01;
            4'b01xx : out = 2'b10;
            4'b1xxx : out = 2'b11;

            default : valid = 0; //output is invalid
        endcase
    end

endmodule