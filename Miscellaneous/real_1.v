module tb;

real r[30:1];
integer i;

initial begin
    for (i = 1; i <= 30; i = i + 1) begin
        r[i] = $urandom_range(250, 350) / 10.0;
        $display("Random real number r[%0d]: %.1f", i, r[i]);
    end
end

endmodule