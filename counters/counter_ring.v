module counter_ring #(
    parameter WIDTH = 8
) (
    input  wire             clk,
    input  wire             rst_n,
    input  wire             en,
    output reg  [WIDTH-1:0] ring
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            ring <= {{(WIDTH-1){1'b0}}, 1'b1};
        else if (en)
            ring <= {ring[WIDTH-2:0], ring[WIDTH-1]};
    end

endmodule
