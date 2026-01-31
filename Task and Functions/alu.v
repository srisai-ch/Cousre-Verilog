module tb;

parameter NO_OPERATION     = 4'b0000;
parameter SUM              = 4'b0001;
parameter SUB              = 4'b0010;
parameter MUL              = 4'b0011;
parameter DIV              = 4'b0100;
parameter MOD              = 4'b0101;
parameter POWER            = 4'b0110;
parameter LEFT_SHIFT       = 4'b0111;
parameter RIGHT_SHIFT      = 4'b1000;


reg [7:0] operand1;
reg [7:0] operand2; 
reg [3:0] operation_code;
reg [31:0] result;

initial begin
    repeat (20) begin
        operand1 = $random % 256; // Random 8-bit number
        operand2 = $random % 256; // Random 8-bit number
        operation_code = $random % 9; // Random operation code between 0 and 8

        result = alu(operand1, operand2, operation_code);
        #1;
    end     
end

initial begin
    $monitor("Time: %0t | Op1: %d | Op2: %d | OpCode: %s | Result: %d", $time, operand1, operand2, 
            operation_code == NO_OPERATION ? "0000 (NO_OPERATION)" :
            operation_code == SUM ? "0001 (SUM)" :
            operation_code == SUB ? "0010 (SUB)" :
            operation_code == MUL ? "0011 (MUL)" :
            operation_code == DIV ? "0100 (DIV)" :
            operation_code == MOD ? "0101 (MOD)" :
            operation_code == POWER ? "0110 (POWER)" :
            operation_code == LEFT_SHIFT ? "0111 (LEFT_SHIFT)" :
            operation_code == RIGHT_SHIFT ? "1000 (RIGHT_SHIFT)" : "UNKNOWN"
        , result);
end


function reg [31:0] alu(input reg [7:0] op1, input reg [7:0] op2, input reg [3:0] operation);
begin
    case(operation)
        NO_OPERATION    : alu = 32'b0;      // No operation
        SUM             : alu = op1 + op2;  // Addition 
        SUB             : alu = op1 - op2;  // Subtraction
        MUL             : alu = op1 * op2;  // Multiplication
        DIV             : alu = op1 / op2;  // Division
        MOD             : alu = op1 % op2;  // modulus
        POWER           : alu = op1 ** op2; // Exponentiation
        LEFT_SHIFT      : alu = op1 << 1;   // Shift Left
        RIGHT_SHIFT     : alu = op1 >> op2; // Shift Right
        default         : alu = 32'b0;      // Default case
    endcase
end
endfunction

endmodule