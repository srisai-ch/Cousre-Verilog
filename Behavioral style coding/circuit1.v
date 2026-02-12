module circuit1 (
    input a,
    input b,
    input c,
    input clk,
    input res,
    output reg y,
    output reg w
)

alwats @(posedge clk) begin
    if (res) begin
        y = 0;
        w = 0;
    end else begin
        y = a&b;
        w = ~c;
    end
end

endmodule