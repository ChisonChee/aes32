`timescale 1ns / 1ns

module subbytes (
input clk,
input [31:0] cin0, cin1, cin2, cin3,
output [31:0] dout0, dout1, dout2, dout3
);

wire [31:0] c0, c1, c2, c3; 

subbytes_32 a0(clk, cin0, c0);
subbytes_32 a1(clk, cin1, c1);
subbytes_32 a2(clk, cin2, c2);
subbytes_32 a3(clk, cin3, c3);

assign dout0 = c0;
assign dout1 = c1;
assign dout2 = c2;
assign dout3 = c3;

endmodule

module subbytes_32 (clk,data,s_data_out);
input clk;
input [31:0]data;
output  reg [31:0]s_data_out;

wire [31:0] tmp_out;
	
sbox r0(data[31:24],tmp_out[31:24]);
sbox r1(data[23:16],tmp_out[23:16]);
sbox r2(data[15:8],tmp_out[15:8]);
sbox r3(data[7:0],tmp_out[7:0]);
	  
always@(posedge clk)
begin
	s_data_out = tmp_out;
end

endmodule