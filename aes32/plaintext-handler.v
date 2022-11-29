`timescale 1ns/1ns
module aes32_round_input(clk, din_0, din_1, din_2, din_3, dout_0, dout_1, dout_2, dout_3);
input clk;
input [31:0] din_0, din_1, din_2, din_3;
output [31:0] dout_0, dout_1, dout_2, dout_3;

wire [31:0] tmp0, tmp1, tmp2, tmp3;

aes32_column_a state0(clk, din_0, din_1, din_2, din_3, tmp0);
aes32_column_b state1(clk, din_0, din_1, din_2, din_3, tmp1);
aes32_column_c state2(clk, din_0, din_1, din_2, din_3, tmp2);
aes32_column_d state3(clk, din_0, din_1, din_2, din_3, tmp3);

assign dout_0 = tmp0; 
assign dout_1 = tmp1;
assign dout_2 = tmp2;
assign dout_3 = tmp3;

endmodule


module aes32_column_a (clk, a0, a1, a2, a3, a_out);
input clk;
input [31:0] a0, a1, a2, a3; 
output reg [31:0] a_out;
always@* begin
a_out = {a0[31:24],a1[23:16],a2[15:8],a3[7:0]};
end
endmodule


module aes32_column_b (clk, b0, b1, b2, b3, b_out);
input clk;
input [31:0] b0, b1, b2, b3; 
output reg [31:0] b_out;

wire [31:0] b_1;
always@* begin
b_out = {b1[31:24],b2[23:16],b3[15:8],b0[7:0]};
end
endmodule


module aes32_column_c (clk, c0, c1, c2, c3, c_out);
input clk;
input [31:0] c0, c1, c2, c3; 
output reg [31:0] c_out;

wire [31:0] c_1;

always@* begin
c_out = {c2[31:24],c3[23:16],c0[15:8],c1[7:0]};
end
endmodule


module aes32_column_d (clk, d0, d1, d2, d3, d_out);
input clk;
input [31:0] d0, d1, d2, d3; 
output reg [31:0] d_out;

wire [31:0] d_1;
always@* begin
d_out = {d3[31:24],d0[23:16],d1[15:8],d2[7:0]};
end
endmodule
