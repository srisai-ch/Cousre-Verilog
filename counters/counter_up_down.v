module counter_up_down #(
    parameter WIDTH = 8
) (
    input  wire             clk,
    input  wire             rst_n,
    input  wire             en,
    input  wire             up,
    output reg  [WIDTH-1:0] count
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= {WIDTH{1'b0}};
        else if (en)
            if (up)
                count <= count + {{(WIDTH-1){1'b0}}, 1'b1};
            else
                count <= count - {{(WIDTH-1){1'b0}}, 1'b1};
    end

endmodule
