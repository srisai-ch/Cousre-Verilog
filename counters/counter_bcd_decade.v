module counter_bcd_decade (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       en,
    output reg  [3:0] bcd,
    output wire       tc
);

    assign tc = en && (bcd == 4'd9);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            bcd <= 4'd0;
        else if (en)
            if (bcd == 4'd9)
                bcd <= 4'd0;
            else
                bcd <= bcd + 4'd1;
    end

endmodule
