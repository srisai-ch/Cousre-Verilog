module tb;

real r;

initial begin
    repeat (10) begin
        r = $urandom_range(100, 200) / 100.0;
        $display("Random real number: %.2f", r);
    end
end

endmodule