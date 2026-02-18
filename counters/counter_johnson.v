module counter_johnson #(
    parameter WIDTH = 8
) (
    input  wire             clk,
    input  wire             rst_n,
    input  wire             en,
    output reg  [WIDTH-1:0] johnson
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            johnson <= {WIDTH{1'b0}};
        else if (en)
            johnson <= {johnson[WIDTH-2:0], ~johnson[WIDTH-1]};
    end

endmodule
