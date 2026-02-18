module counter_gray #(
    parameter WIDTH = 8
) (
    input  wire             clk,
    input  wire             rst_n,
    input  wire             en,
    output wire [WIDTH-1:0] gray_count
);

    reg [WIDTH-1:0] bin_count;

    assign gray_count = bin_count ^ (bin_count >> 1);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            bin_count <= {WIDTH{1'b0}};
        else if (en)
            bin_count <= bin_count + {{(WIDTH-1){1'b0}}, 1'b1};
    end

endmodule
