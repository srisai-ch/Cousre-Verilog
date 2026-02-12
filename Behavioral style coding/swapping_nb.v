module tb;

integer a, b;

initial begin
    #0; a = 10; b = 20;
    #10 $display("a = %0d, b = %0d", a, b);
end

initial begin
    #5 b <= a; 
end

initial begin
    #5 a <= b;
end

endmodule