`include "encoder_8x3.v"

module tb;

reg [7:0] in;
wire [2:0] out;
wire valid;
integer seed;

encoder_8x3 dut(in, out, valid);

initial begin
    seed = 193;
    $monitor("%t : in = %b, out = %b, valid = %b",$time, in, out, valid);

    repeat(30) begin
        in = $random(seed);
        #1;
    end

end

endmodule