module processor();

parameter DEPTH = 1024; 
parameter ADDR_WIDTH = $clog2(DEPTH);   
parameter WIDTH = 16;   

input clk_i, rst_i; 
output [ADDR_WIDTH-1:0] addr_o; 
output [WIDTH-1:0] wdata_o; 
output wr_rd_o; // 1 for write, 0 for read
input [WIDTH-1:0] rdata_i;
output valid_o;
input ready_i;


endmodule