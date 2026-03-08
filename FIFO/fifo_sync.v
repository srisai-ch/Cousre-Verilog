`timescale 1ns/1ps
module fifo_sync#( 
    parameter DEPTH = 16,
    parameter DATA_WIDTH = 8,
    parameter PTR_WIDTH = $clog2(DEPTH)
 )(
    input clk_i,
    input rst_i,
    input wr_en_i,
    input rd_en_i,
    input [DATA_WIDTH-1:0] wr_data_i,

    output reg [DATA_WIDTH-1:0] rd_data_o,
    output reg full_o,
    output reg empty_o,
    output reg underflow_o,
    output reg overflow_o
);

reg [DATA_WIDTH-1:0] fifo_mem[DEPTH-1:0];
integer i;
reg [PTR_WIDTH-1:0] wr_ptr, rd_ptr;
reg wr_toggle, rd_toggle;

always @(posedge clk_i) begin
    if (rst_i)begin
        rd_data_o = 0;
        full_o = 0;
        empty_o = 1;
        underflow_o = 0;
        overflow_o  = 0;
        wr_toggle = 0;
        rd_toggle = 0;
        wr_ptr = 0;
        rd_ptr = 0;
        for (i = 0; i < DEPTH; i = i + 1) begin
            fifo_mem[i] <= 0;
        end
    end
    else begin
        overflow_o = 0;
        underflow_o = 0;
        if(wr_en_i) begin
            if(full_o) begin
               overflow_o = 1; 
            end
            else begin
                fifo_mem[wr_ptr] = wr_data_i;
                if(wr_ptr == DEPTH-1) begin
                    wr_toggle = ~wr_toggle;
                end
                wr_ptr = wr_ptr + 1;
            end
        end
        if(rd_en_i) begin
            if(empty_o) begin
               underflow_o = 1; 
            end
            else begin
                rd_data_o = fifo_mem[rd_ptr];
                if(rd_ptr == DEPTH-1) begin
                    rd_toggle = ~rd_toggle;
                end
                rd_ptr = rd_ptr + 1;
            end
        end        
    end
end

always @(*) begin
    empty_o = 0;
    full_o = 0;
    if(wr_ptr == rd_ptr && wr_toggle == rd_toggle) begin
        empty_o = 1;
    end
    else if(wr_ptr == rd_ptr && wr_toggle != rd_toggle) begin
        full_o = 1;
    end
end

endmodule