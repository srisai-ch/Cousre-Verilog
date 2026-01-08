module memory(clk_i, rst_i, addr_i, wdata_i, wr_rd_i, rdata_o, valid_i, ready_o);

parameter DEPTH = 1024; 
parameter ADDR_WIDTH = $clog2(DEPTH);   
parameter WIDTH = 16;   

input clk_i, rst_i; 
input [ADDR_WIDTH-1:0] addr_i; 
input [WIDTH-1:0] wdata_i; 
input wr_rd_i; // 1 for write, 0 for read
output reg [WIDTH-1:0] rdata_o;
input valid_i;
output reg ready_o;




endmodule