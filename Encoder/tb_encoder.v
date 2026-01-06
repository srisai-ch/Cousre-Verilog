`include "encoder_4x2.v"

module tb;

reg [3:0] in;
wire [1:0] out;
wire valid;
integer seed;

encoder_4x2 dut(in, out, valid);

initial begin
    seed = 193;
    $monitor("%t : in = %b, out = %b, valid = %b",$time, in, out, valid);

    repeat(20) begin
        in = $random(seed);
        #1;
    end

end

endmodule