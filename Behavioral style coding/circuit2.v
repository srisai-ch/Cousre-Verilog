module circuit2 (
    input a,
    input b,
    input clk,
    input res,
    output reg y
);

reg n1;
wire n2;

always @(posedge clk) begin
    if (res) begin
        n1 <= 0;
        y <= 0;
    end else begin
        n1 <= a;
        y <= n2;
    end
end

assign n2 = n1 & b;

endmodule