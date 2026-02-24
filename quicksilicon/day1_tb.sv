module tb;

  logic [7:0] a_i;
  logic [7:0] b_i;
  logic       sel_i;
  logic [7:0] y_o;

  day1 DAY1 (.*);

  initial begin
    for (int i = 0; i < 10; i++) begin
      a_i   = $urandom_range (0, 8'hFF);
      b_i   = $urandom_range (0, 8'hFF);
      sel_i = $random%2;
      #1;
      $display ("a_i = %h, b_i = %h, sel_i = %b, y_o = %h", a_i, b_i, sel_i, y_o);
      #5;
    end
    $finish();
  end

endmodule