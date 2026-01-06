module memory();

parameter DEPTH = 1024; 
parameter ADDR_WIDTH = $clog2(DEPTH);   
parameter WIDTH = 16;   

input clk_i, rst_i; 
input [ADDR_WIDTH-1:0] addr_o; 
input [WIDTH-1:0] wdata_o; 
input wr_rd_o; // 1 for write, 0 for read
output [WIDTH-1:0] rdata_i;
input valid_o;
output ready_i;


endmodule