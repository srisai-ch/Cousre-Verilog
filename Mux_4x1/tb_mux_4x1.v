`include "mux_4x1_dataflow.v"
module tb;

reg [3:0] i;
reg [1:0] sel;
wire out;
integer seed;

mux_4x1 dut(
    .i(i),
    .sel(sel),
    .out(out)
    );

initial begin
    seed = 4353453;
    repeat(15) begin
        {i, sel} = $random(seed);
        #1;
        $display("%0t :  i = %b, sel = %b, out = %b", $time, i, sel, out);
    end
end

endmodule