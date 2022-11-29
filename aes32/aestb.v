`timescale 1ns / 1ns
module encryption_test();
    reg clk;
    reg [31:0] data_0, data_1, data_2, data_3, key_0, key_1, key_2, key_3;
    wire [31:0] dout_0, dout_1, dout_2, dout_3;


	 aes main (clk, data_0, data_1, data_2, data_3, key_0, key_1, key_2, key_3, dout_0, dout_1, dout_2, dout_3);

    always #10 
        clk =~clk;

    initial begin
  
        clk = 0;
        #20
        key_0 = 32'h 00010203; 
		  key_1 = 32'h 04050607; 
		  key_2 = 32'h 08090a0b; 
		  key_3 = 32'h 0c0d0e0f;
		  
        data_0 = 32'h 00112233;
		  data_1 = 32'h 44556677;
		  data_2 = 32'h 8899aabb; 
		  data_3 = 32'h ccddeeff;
    end           
endmodule