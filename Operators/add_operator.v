module tb;

reg [3:0] a, b, c;
reg [3:0] d, e, f;

initial begin
    a = 4'b1101;
    b = 4'b0110;
    c = 4'b0111;

    d = a & b; // Bitwise AND
    $display("a(%b) & b(%b) = %b", a, b, d);

    e = a && b; // Logical AND
    $display("a(%b) && b(%b) = %b", a, b, e);

    f = &c; // Reduction AND
    $display("c(%b) reduced to %b", c, f);

end


endmodule