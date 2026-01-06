module comp_1bit (
    input a,
    input b,
    output reg gt,
    output reg eq,
    output reg lt
);
    always @(*) begin
        gt = 0;
        eq = 0;
        lt = 0; 

        if (a > b) gt = 1;
        if (a < b) lt = 1;
        if (a == b) eq = 1;
    end
    
endmodule