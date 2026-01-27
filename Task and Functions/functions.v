module tb;

integer intA1[4:0];
integer intA2[4:0];
integer intA3[4:0];

initial begin

    for(i=0; i<5; i=i+1) begin
        intA3[i] = add(intA1[i], intA2[i]);
    end

end

function integer add (input integer a, input integer b);
begin
   add = a + b; 
end
endfunction

function real sub (input integer a, input real b)
begin
   sub = a - b; 
end
endfunction

endmodule