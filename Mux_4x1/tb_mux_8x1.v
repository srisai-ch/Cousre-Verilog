`include "mux_8x1_behv.v"
module tb;

reg [7:0] i;
reg [2:0] sel;
wire out;
integer seed;

mux_8x1 dut(
    .i(i),
    .sel(sel),
    .out(out)
    );

initial begin
    seed = 4353453;
    $monitor("%0t :  i = %b, sel = %b, out = %b", $time, i, sel, out);
    repeat(15) begin
        {i, sel} = $random(seed);
        #1;
    end
end

endmodule