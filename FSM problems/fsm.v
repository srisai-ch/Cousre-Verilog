module seq_1011_moore (
    input  wire clk,
    input  wire rst,
    input  wire x,
    output reg  y
);
    typedef enum logic [2:0] {S0, S1, S10, S101, S1011} state_t;
    state_t state, next;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst) state <= S0;
        else     state <= next;
    end

    // Next-state logic
    always @(*) begin
        case (state)
            S0:    next = x ? S1    : S0;
            S1:    next = x ? S1    : S10;
            S10:   next = x ? S101  : S0;
            S101:  next = x ? S1011 : S10;
            S1011: next = x ? S1    : S10; // overlap handling
            default: next = S0;
        endcase
    end

    // Output logic (Moore)
    always @(*) begin
        y = (state == S1011);
    end
endmodule
