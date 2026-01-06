module mux_2x1(
    input i0,
    input i1,
    input sel,
    output reg out
);

always @(*)begin 
    if (sel == 0)
        out = i0;
    else if (sel == 1)
        out = i1;
    else
        out = 1'bx;
end

endmodule


