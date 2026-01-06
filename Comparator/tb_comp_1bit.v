`include "comp_1bit_behv.v"

module tb;

reg a, b;
wire gt, eq, lt;
integer xyz;

comp_1bit dut(a, b, gt, eq, lt);

initial begin
    xyz = 435345;
    $monitor("%0t : a = %b, b = %b, gt = %b, eq = %b, lt = %b", $time, a, b, gt, eq, lt);
    repeat(10) begin
        {a,b} = $random(xyz);
        #1;
    end
end
endmodule