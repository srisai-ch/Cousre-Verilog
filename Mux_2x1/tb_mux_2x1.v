`include "mux_2x1_dataflow.v"
module tb;

reg i0,i1,sel;
wire out;
integer seed;
mux_2x1 dut(
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .out(out)
    );

initial begin
    seed = 4353453;
    repeat(10) begin
        {i0, i1, sel} = $random(seed);
        #1;
        $display("%0t : i0 = %b, i1 = %b, sel = %b, out = %b", $time, i0, i1, sel, out);
    end
end

endmodule