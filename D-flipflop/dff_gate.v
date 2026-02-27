module dff(clk, rst, d, q);
input clk, rst, d;
output q;

not(n1, d);
and(n2, d,clk);
and(n3, n1, clk);
nor(n5, n2, n6);
nor(n6, n5, n3);
and(n7, n4, n5);
and(n8, n6, n4);
nor(q, n7, n9, rst);
nor(n9, n8, q);
not(n4, clk);

endmodule