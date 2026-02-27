`timescale 1ns/1ps
`include "memory.v"
module tb;

parameter WIDTH = 16;
parameter DEPTH = 64;
parameter ADDR_WIDTH = $clog2(DEPTH);

reg clk_i, rst_i;
reg [ADDR_WIDTH-1:0] addr_i;
reg [WIDTH-1:0] wdata_i;
reg wr_rd_i;
wire [WIDTH-1:0] rdata_o;
reg valid_i;
wire ready_o;

memory #(.DEPTH(DEPTH), .WIDTH(WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) dut(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .addr_i(addr_i),
    .wdata_i(wdata_i),
    .wr_rd_i(wr_rd_i),
    .rdata_o(rdata_o),
    .valid_i(valid_i),
    .ready_o(ready_o)
);

initial begin
    clk_i = 0;
    forever #5 clk_i = ~clk_i;
end

initial begin
    reset_mem();
    write_mem(6'h15, 5);
    read_mem(6'h15, 5);


    #100;
    $finish;

    
end

task reset_mem();
    begin
        rst_i = 1;
        valid_i = 0;
        addr_i = 0;
        wdata_i = 0;
        wr_rd_i = 0;
        @(posedge clk_i);
        rst_i = 0;
    end
endtask

task write_mem(input [ADDR_WIDTH-1:0] start_loc, input [ADDR_WIDTH-1:0] num_loctions);
    integer i;
    begin
        for(i = start_loc; i < start_loc + num_loctions; i = i + 1) begin
            @(posedge clk_i);
            addr_i = i;
            wdata_i = $random;
            wr_rd_i = 1;
            valid_i = 1;
            wait (ready_o == 1);
        end
        @(posedge clk_i);
        addr_i = 0;
        wdata_i = 0;
        wr_rd_i = 0;
        valid_i = 0;
    end
endtask

task read_mem(input [ADDR_WIDTH-1:0] start_loc, input [ADDR_WIDTH-1:0] num_loctions);
    integer i;
    begin
        for(i = start_loc; i < start_loc + num_loctions; i = i + 1) begin
            @(posedge clk_i);
            addr_i = i;
            wr_rd_i = 0;
            valid_i = 1;
            wait (ready_o == 1);
        end
        @(posedge clk_i);
        addr_i = 0;
        wr_rd_i = 0;
        valid_i = 0;
    end
endtask


endmodule