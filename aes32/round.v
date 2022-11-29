`timescale 1ns/1ns

module round (clk, cin0, cin1, cin2, cin3, key0, key1, key2, key3, dout0, dout1, dout2, dout3);
input clk;
input [31:0] cin0, cin1, cin2, cin3, key0, key1, key2, key3;
output [31:0] dout0, dout1, dout2, dout3;

wire [31:0] s0, s1, s2, s3, m0, m1, m2, m3;

subbytes su(clk, cin0, cin1, cin2, cin3, s0, s1, s2, s3);
mixcolumn mu(clk, s0, s1, s2 ,s3 ,m0, m1, m2, m3);

assign dout0 = m0^key0;
assign dout1 = m1^key1;
assign dout2 = m2^key2;
assign dout3 = m3^key3;

endmodule