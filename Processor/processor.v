module processor(clk_i, rst_i, addr_o, wdata_o, wr_rd_o, rdata_i, valid_o, ready_i);

parameter DEPTH = 1024; 
parameter ADDR_WIDTH = $clog2(DEPTH);   
parameter WIDTH = 16;   

input clk_i, rst_i; 
output reg [ADDR_WIDTH-1:0] addr_o; 
output reg [WIDTH-1:0] wdata_o; 
output reg wr_rd_o; // 1 for write, 0 for read
input [WIDTH-1:0] rdata_i;
output reg valid_o;
input ready_i;


endmodule