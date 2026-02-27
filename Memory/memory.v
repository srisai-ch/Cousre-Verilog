//2KB memory with 16-bit width and 64 depth
module memory
    #(parameter WIDTH = 16,
      parameter DEPTH = 1024,
      parameter ADDR_WIDTH = $clog2(DEPTH)
    ) (
    input clk_i, rst_i,
    input [ADDR_WIDTH-1:0] addr_i,
    input [WIDTH-1:0] wdata_i,
    input wr_rd_i,
    output reg [WIDTH-1:0] rdata_o,
    input valid_i,
    output reg ready_o
);

reg [WIDTH-1:0] mem[DEPTH-1:0];
integer i;

always@(posedge clk_i) begin
    if (rst_i == 1) begin
        rdata_o <= 0;
        ready_o <= 0;
        for(i = 0; i < DEPTH; i = i + 1) begin
            mem[i] <= 0;
        end
    end
    else begin
        if(valid_i == 1) begin
            ready_o <= 1;
            if(wr_rd_i == 1) begin
                mem[addr_i] <= wdata_i;
            end
            else begin
                rdata_o <= mem[addr_i];
            end
        end
        else begin
            ready_o <= 0;
        end
    end
end
endmodule