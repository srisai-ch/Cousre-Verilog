module counter_mod_n #(
    parameter WIDTH = 8,
    parameter MOD_VALUE = 100
) (
    input  wire             clk,
    input  wire             rst_n,
    input  wire             en,
    output reg  [WIDTH-1:0] count,
    output wire             tc
);

    assign tc = en && (count == MOD_VALUE-1);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= {WIDTH{1'b0}};
        else if (en)
            if (count == MOD_VALUE-1)
                count <= {WIDTH{1'b0}};
            else
                count <= count + {{(WIDTH-1){1'b0}}, 1'b1};
    end

endmodule
