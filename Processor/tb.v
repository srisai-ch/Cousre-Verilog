module tb;

parameter DEPTH = 1024; 
parameter ADDR_WIDTH = $clog2(DEPTH);
parameter WIDTH = 16;

wire [ADDR_WIDTH-1:0] addr;
wire [WIDTH-1:0] wdata;
wire wr_rd;
wire [WIDTH-1:0] rdata;
wire valid;
wire ready;

processor u0(
    .clk_i(clk), 
    .rst_i(rst), 
    .addr_o(addr), 
    .wdata_o(wdata), 
    .wr_rd_o(wr_rd), 
    .rdata_i(rdata), 
    .valid_o(valid), 
    .ready_i(ready)
);

memory mem(
    .clk_i(clk), 
    .rst_i(rst), 
    .addr_i(addr), 
    .wdata_i(wdata), 
    .wr_rd_i(wr_rd), 
    .rdata_o(rdata), 
    .valid_i(valid), 
    .ready_o(ready)
);


endmodule