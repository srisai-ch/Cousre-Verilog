`include "fifo_sync.v"
module tb;
parameter DEPTH = 16;
parameter DATA_WIDTH = 8;
parameter PTR_WIDTH = $clog2(DEPTH);

reg clk_i, rst_i;
reg wr_en_i, rd_en_i;
reg [DATA_WIDTH-1:0] wr_data_i;
wire full_o, empty_o, underflow_o, overflow_o;
wire [DATA_WIDTH-1:0] rd_data_o;
integer i;

fifo_sync #(
    .DEPTH(DEPTH),
    .DATA_WIDTH(DATA_WIDTH),
    .PTR_WIDTH(PTR_WIDTH)
) dut (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .wr_en_i(wr_en_i),
    .rd_en_i(rd_en_i),
    .wr_data_i(wr_data_i),
    .rd_data_o(rd_data_o),
    .full_o(full_o),
    .empty_o(empty_o),
    .underflow_o(underflow_o),
    .overflow_o(overflow_o)
);

initial begin
    clk_i = 0;
    forever #5 clk_i = ~clk_i;
end

initial begin
    reset_fifo();
    write_fifo(DEPTH);
    read_fifo(DEPTH);
    #100;
    $finish;       
end

task reset_fifo;
    begin
        rst_i = 1;
        wr_en_i = 0;
        rd_en_i = 0;
        wr_data_i = 0;
        @(posedge clk_i);
        rst_i = 0;
    end
endtask

task write_fifo(input integer num_writes);
    begin
    for (i = 0; i < num_writes; i = i + 1) begin
        @(posedge clk_i);
        wr_en_i = 1;
        wr_data_i = $random;
    end
    @(posedge clk_i);
    wr_en_i = 0;
    wr_data_i = 0;
    end
endtask

task read_fifo(input integer num_reads);
    begin
    for (i = 0; i < num_reads; i = i + 1) begin
        @(posedge clk_i);
        rd_en_i = 1;
    end
    @(posedge clk_i);
    rd_en_i = 0;
    end
endtask

endmodule