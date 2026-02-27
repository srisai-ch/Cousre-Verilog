module dff(clk, rst, d, q);
input clk, rst, d;
output reg q;

always @(posedge clk) begin  // synchronous reset
    if (rst) begin
        q <= 1'b0;
    end else begin
        q <= d;
    end
end

endmodule