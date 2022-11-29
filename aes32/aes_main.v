`timescale 1ns / 1ns
module aes (clk, data_0, data_1, data_2, data_3, key_0, key_1, key_2, key_3, out_0, out_1, out_2, out_3);
input clk;
input [31:0] data_0, data_1, data_2, data_3, key_0, key_1, key_2, key_3;
output [31:0] out_0, out_1, out_2, out_3;

// round key 0 //
wire [31:0] w0, w1, w2, w3;
// round key 1 //
wire [31:0] w4, w5, w6, w7;
// round key 2 // 
wire [31:0] w8, w9, w10, w11; 
// round key 3 //
wire [31:0] w12, w13, w14, w15;
// round key 4 //
wire [31:0] w16, w17, w18, w19;
// round key 5 // 
wire [31:0] w20, w21, w22, w23;
// round key 6 // 
wire [31:0] w24, w25, w26, w27;
// round key 7 // 
wire [31:0] w28, w29, w30, w31;
// round key 8 // 
wire [31:0] w32, w33, w34, w35;
// round key 9 // 
wire [31:0] w36, w37, w38, w39;
// round key 10 // 
wire [31:0] w40, w41, w42, w43;

// round 0|input //
wire [31:0] init_s0, init_s1, init_s2, init_s3;
// round 1 // 
wire [31:0] r1_out0, r1_out1, r1_out2, r1_out3, r1_dout0, r1_dout1, r1_dout2, r1_dout3;
// round 2 // 
wire [31:0] r2_out0, r2_out1, r2_out2, r2_out3, r2_dout0, r2_dout1, r2_dout2, r2_dout3;
// round 3 //
wire [31:0] r3_out0, r3_out1, r3_out2, r3_out3, r3_dout0, r3_dout1, r3_dout2, r3_dout3;
// round 4 // 
wire [31:0] r4_out0, r4_out1, r4_out2, r4_out3, r4_dout0, r4_dout1, r4_dout2, r4_dout3; 
// round 5 //
wire [31:0] r5_out0, r5_out1, r5_out2, r5_out3, r5_dout0, r5_dout1, r5_dout2, r5_dout3;
// round 6 // 
wire [31:0] r6_out0, r6_out1, r6_out2, r6_out3, r6_dout0, r6_dout1, r6_dout2, r6_dout3;
// round 7 //
wire [31:0] r7_out0, r7_out1, r7_out2, r7_out3, r7_dout0, r7_dout1, r7_dout2, r7_dout3;
// round 8 //
wire [31:0] r8_out0, r8_out1, r8_out2, r8_out3, r8_dout0, r8_dout1, r8_dout2, r8_dout3;
// round 9 // 
wire [31:0] r9_out0, r9_out1, r9_out2, r9_out3, r9_dout0, r9_dout1, r9_dout2, r9_dout3;
// round 10 //
wire [31:0] r10_out0, r10_out1, r10_out2, r10_out3, r10_dout0, r10_dout1, r10_dout2, r10_dout3;

aes_key_expand_128  KU (clk,key_0,key_1,key_2,key_3,
								w0, w1, w2, w3, 
								w4, w5, w6, w7, 
								w8, w9, w10, w11, 
								w12, w13, w14, w15,
								w16, w17, w18, w19, 
								w20, w21, w22, w23, 
								w24, w25, w26, w27, 
								w28, w29, w30, w31, 
								w32, w33, w34, w35, 
								w36, w37, w38, w39, 
								w40, w41, w42, w43
								);
// input //						
assign init_s0 = data_0^w0;
assign init_s1 = data_1^w1;
assign init_s2 = data_2^w2;
assign init_s3 = data_3^w3;

// round 1 //
aes32_round_input r1_in (clk, init_s0, init_s1, init_s2, init_s3, r1_out0, r1_out1, r1_out2, r1_out3);
round r1_out (clk, r1_out0, r1_out1, r1_out2, r1_out3, w4, w5, w6, w7, r1_dout0, r1_dout1, r1_dout2, r1_dout3);

// round 2 //
aes32_round_input r2_in (clk, r1_dout0, r1_dout1, r1_dout2, r1_dout3, r2_out0, r2_out1, r2_out2, r2_out3);
round r2_out (clk, r2_out0, r2_out1, r2_out2, r2_out3,w8, w9, w10, w11, r2_dout0, r2_dout1, r2_dout2, r2_dout3);

// round 3 //
aes32_round_input r3_in (clk, r2_dout0, r2_dout1, r2_dout2, r2_dout3, r3_out0, r3_out1, r3_out2, r3_out3);
round r3_out (clk, r3_out0, r3_out1, r3_out2, r3_out3, w12, w13, w14, w15, r3_dout0, r3_dout1, r3_dout2, r3_dout3);

// round 4 //
aes32_round_input r4_in (clk, r3_dout0, r3_dout1, r3_dout2, r3_dout3, r4_out0, r4_out1, r4_out2, r4_out3);
round r4_out (clk, r4_out0, r4_out1, r4_out2, r4_out3, w16, w17, w18, w19, r4_dout0, r4_dout1, r4_dout2, r4_dout3);

// round 5 //
aes32_round_input r5_in (clk, r4_dout0, r4_dout1, r4_dout2, r4_dout3, r5_out0, r5_out1, r5_out2, r5_out3);
round r5_out (clk, r5_out0, r5_out1, r5_out2, r5_out3, w20, w21, w22, w23, r5_dout0, r5_dout1, r5_dout2, r5_dout3);

// round 6 //
aes32_round_input r6_in (clk, r5_dout0, r5_dout1, r5_dout2, r5_dout3, r6_out0, r6_out1, r6_out2, r6_out3);
round r6_out (clk, r6_out0, r6_out1, r6_out2, r6_out3, w24, w25, w26, w27, r6_dout0, r6_dout1, r6_dout2, r6_dout3);

// round 7 //
aes32_round_input r7_in (clk, r6_dout0, r6_dout1, r6_dout2, r6_dout3, r7_out0, r7_out1, r7_out2, r7_out3);
round r7_out (clk, r7_out0, r7_out1, r7_out2, r7_out3, w28, w29, w30, w31, r7_dout0, r7_dout1, r7_dout2, r7_dout3);

// round 8 //
aes32_round_input r8_in (clk, r7_dout0, r7_dout1, r7_dout2, r7_dout3, r8_out0, r8_out1, r8_out2, r8_out3);
round r8_out (clk, r8_out0, r8_out1, r8_out2, r8_out3, w32, w33, w34, w35, r8_dout0, r8_dout1, r8_dout2, r8_dout3);

// round 9 //
aes32_round_input r9_in (clk, r8_dout0, r8_dout1, r8_dout2, r8_dout3, r9_out0, r9_out1, r9_out2, r9_out3);
round r9_out (clk, r9_out0, r9_out1, r9_out2, r9_out3, w36, w37, w38, w39, r9_dout0, r9_dout1, r9_dout2, r9_dout3);

// last round // 
aes32_round_input r10_in (clk, r9_dout0, r9_dout1, r9_dout2, r9_dout3, r10_out0, r10_out1, r10_out2, r10_out3);
last_round r10_out (clk, r10_out0, r10_out1, r10_out2, r10_out3, w40, w41, w42, w43, r10_dout0, r10_dout1, r10_dout2, r10_dout3);

// output // 
assign out_0 = r10_dout0; 
assign out_1 = r10_dout1; 
assign out_2 = r10_dout2;
assign out_3 = r10_dout3;

endmodule