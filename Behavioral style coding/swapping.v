module tb;

integer a, b;
integer temp;

/* initial begin
    a = 10;
    b = 20;
    temp = a;
    a = b;
    b = temp;
    $display("After swapping: a = %0d, b = %0d", a, b);
end  */

initial begin
    a = 10;
    b = 20;
    a = a + b; 
    b = a - b; 
    a = a - b; 
    $display("After swapping: a = %0d, b = %0d", a, b);
end

endmodule