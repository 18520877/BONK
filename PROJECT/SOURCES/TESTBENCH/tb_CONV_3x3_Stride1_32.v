`timescale 1ns / 1ps
// Convolution Kernel 3x3, Stride = 2, Padding = 0.

module tb_CONV_3x3_Stride1_32;
  parameter data_width = 32;
  parameter D = 9;
  parameter T = D*D;
	parameter C = 10;
	parameter I = 20;
	integer i;
	
	reg clk;
	reg reset;
	reg valid_in_1,  valid_in_2,  valid_in_3,  valid_in_4,  valid_in_5,  valid_in_6,
    	       valid_in_7,  valid_in_8,  valid_in_9,  valid_in_10, valid_in_11, valid_in_12,
    	       valid_in_13, valid_in_14, valid_in_15, valid_in_16, valid_in_17, valid_in_18,
    	       valid_in_19, valid_in_20, valid_in_21, valid_in_22, valid_in_23, valid_in_24,
  	         valid_in_25, valid_in_26, valid_in_27, valid_in_28, valid_in_29, valid_in_30,
    	       valid_in_31, valid_in_32;
    	      
    	  reg [data_width-1:0] pxl_in_1,  pxl_in_2,  pxl_in_3,  pxl_in_4,  pxl_in_5,  pxl_in_6,
    	                       pxl_in_7,  pxl_in_8,  pxl_in_9,  pxl_in_10, pxl_in_11, pxl_in_12,
    	                       pxl_in_13, pxl_in_14, pxl_in_15, pxl_in_16, pxl_in_17, pxl_in_18,
    	                       pxl_in_19, pxl_in_20, pxl_in_21, pxl_in_22, pxl_in_23, pxl_in_24,
    	                       pxl_in_25, pxl_in_26, pxl_in_27, pxl_in_28, pxl_in_29, pxl_in_30,
    	                       pxl_in_31, pxl_in_32;

	
	reg [data_width-1:0]In1[T-1:0];
	reg [data_width-1:0]In2[T-1:0];
	reg [data_width-1:0]In3[T-1:0];
	reg [data_width-1:0]In4[T-1:0];
	reg [data_width-1:0]In5[T-1:0];
	reg [data_width-1:0]In6[T-1:0];
	reg [data_width-1:0]In7[T-1:0];
	reg [data_width-1:0]In8[T-1:0];
	reg [data_width-1:0]In9[T-1:0];
	reg [data_width-1:0]In10[T-1:0];
	reg [data_width-1:0]In11[T-1:0];
	reg [data_width-1:0]In12[T-1:0];
	reg [data_width-1:0]In13[T-1:0];
	reg [data_width-1:0]In14[T-1:0];
	reg [data_width-1:0]In15[T-1:0];
	reg [data_width-1:0]In16[T-1:0];
	reg [data_width-1:0]In17[T-1:0];
	reg [data_width-1:0]In18[T-1:0];
	reg [data_width-1:0]In19[T-1:0];
	reg [data_width-1:0]In20[T-1:0];
	reg [data_width-1:0]In21[T-1:0];
	reg [data_width-1:0]In22[T-1:0];
	reg [data_width-1:0]In23[T-1:0];
	reg [data_width-1:0]In24[T-1:0];
	reg [data_width-1:0]In25[T-1:0];
	reg [data_width-1:0]In26[T-1:0];
	reg [data_width-1:0]In27[T-1:0];
	reg [data_width-1:0]In28[T-1:0];
	reg [data_width-1:0]In29[T-1:0];
	reg [data_width-1:0]In30[T-1:0];
	reg [data_width-1:0]In31[T-1:0];
	reg [data_width-1:0]In32[T-1:0];
	
  
wire [data_width-1:0] pxl_out_1,pxl_out_2,pxl_out_3,pxl_out_4,pxl_out_5,pxl_out_6,pxl_out_7,pxl_out_8,pxl_out_9,
pxl_out_10,pxl_out_11,pxl_out_12,pxl_out_13,pxl_out_14,pxl_out_15,pxl_out_16,pxl_out_17,pxl_out_18,
pxl_out_19,pxl_out_20,pxl_out_21,pxl_out_22,pxl_out_23,pxl_out_24,pxl_out_25,pxl_out_26,pxl_out_27,
pxl_out_28,pxl_out_29,pxl_out_30,pxl_out_31,pxl_out_32;  
  
  wire valid_out_1,valid_out_2,valid_out_3,valid_out_4,valid_out_5,valid_out_6,valid_out_7,valid_out_8,valid_out_9,
valid_out_10,valid_out_11,valid_out_12,valid_out_13,valid_out_14,valid_out_15,valid_out_16,valid_out_17,valid_out_18,
valid_out_19,valid_out_20,valid_out_21,valid_out_22,valid_out_23,valid_out_24,valid_out_25,valid_out_26,valid_out_27,
valid_out_28,valid_out_29,valid_out_30,valid_out_31,valid_out_32;
                        
initial begin
 	clk = 0;  
 	i=0;
	reset = 0;

  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In1);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In2);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In3);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In3);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In4);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In5);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In6);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In7);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In8);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In9);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In10);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In11);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In12);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In13);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In14);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In15);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In16);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In17);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In18);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In19);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In20);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In21);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In22);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In23);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In24);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In25);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In26);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In27);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In28);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In29);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In30);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In31);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In32);
 
	end 
	
	always #(C) clk = ~ clk;
	
	always @(posedge clk) begin
  	valid_in_1 = 1;
 	valid_in_2 = 1;
 	valid_in_3 = 1;
 	valid_in_4 = 1;
 	valid_in_5 = 1;
 	valid_in_6 = 1;
 	valid_in_7 = 1;
 	valid_in_8 = 1;
 	valid_in_9 = 1;
 	valid_in_10 = 1;
 	valid_in_11 = 1;
 	valid_in_12 = 1;
 	valid_in_13 = 1;
 	valid_in_14 = 1;
 	valid_in_15 = 1;
 	valid_in_16 = 1;
 	valid_in_17 = 1;
 	valid_in_18 = 1;
 	valid_in_19 = 1;
 	valid_in_20 = 1;
 	valid_in_21 = 1;
 	valid_in_22 = 1;
 	valid_in_23 = 1;
 	valid_in_24 = 1;
 	valid_in_25 = 1;
 	valid_in_26 = 1;
 	valid_in_27 = 1;
 	valid_in_28 = 1;
 	valid_in_29 = 1;
 	valid_in_30 = 1;
 	valid_in_31 = 1;
 	valid_in_32 = 1;
 	
  pxl_in_1 = In1[i];
  pxl_in_2 = In2[i];
  pxl_in_3 = In3[i];
  pxl_in_4 = In4[i];
  pxl_in_5 = In5[i];
  pxl_in_6 = In6[i];
  pxl_in_7 = In7[i];
  pxl_in_8 = In8[i];
  pxl_in_9 = In9[i];
  pxl_in_10 = In10[i];
  pxl_in_11 = In11[i];
  pxl_in_12 = In12[i];
  pxl_in_13 = In13[i];
  pxl_in_14 = In14[i];
  pxl_in_15 = In15[i];
  pxl_in_16 = In16[i];
  pxl_in_17 = In17[i];
  pxl_in_18 = In18[i];
  pxl_in_19 = In19[i];
  pxl_in_20 = In20[i];
  pxl_in_21 = In21[i];
  pxl_in_22 = In22[i];
  pxl_in_23 = In23[i];
  pxl_in_24 = In24[i];
  pxl_in_25 = In25[i];
  pxl_in_26 = In26[i];
  pxl_in_27 = In27[i];
  pxl_in_28 = In28[i];
  pxl_in_29 = In29[i];
  pxl_in_30 = In30[i];
  pxl_in_31 = In31[i];
  pxl_in_32 = In32[i];
   
  #(I) i = i + 1;
  if(i == (T*10)+3) begin
  $finish;
end
end

	CONV_3x3_Stride1_32 #(D,data_width) uut (
		clk, 
		reset, 
		
            valid_in_1,  valid_in_2,  valid_in_3,  valid_in_4,  valid_in_5,  valid_in_6,
    	       valid_in_7,  valid_in_8,  valid_in_9,  valid_in_10, valid_in_11, valid_in_12,
    	       valid_in_13, valid_in_14, valid_in_15, valid_in_16, valid_in_17, valid_in_18,
    	       valid_in_19, valid_in_20, valid_in_21, valid_in_22, valid_in_23, valid_in_24,
  	         valid_in_25, valid_in_26, valid_in_27, valid_in_28, valid_in_29, valid_in_30,
    	       valid_in_31, valid_in_32,
		
		
		                        pxl_in_1,  pxl_in_2,  pxl_in_3,  pxl_in_4,  pxl_in_5,  pxl_in_6,
    	                       pxl_in_7,  pxl_in_8,  pxl_in_9,  pxl_in_10, pxl_in_11, pxl_in_12,
    	                       pxl_in_13, pxl_in_14, pxl_in_15, pxl_in_16, pxl_in_17, pxl_in_18,
    	                       pxl_in_19, pxl_in_20, pxl_in_21, pxl_in_22, pxl_in_23, pxl_in_24,
    	                       pxl_in_25, pxl_in_26, pxl_in_27, pxl_in_28, pxl_in_29, pxl_in_30,
    	                       pxl_in_31, pxl_in_32,
		
		                    pxl_out_1 , pxl_out_2 , pxl_out_3 , pxl_out_4 , pxl_out_5 , pxl_out_6 , pxl_out_7 , pxl_out_8 , pxl_out_9 , pxl_out_10,
                        pxl_out_11, pxl_out_12, pxl_out_13, pxl_out_14, pxl_out_15, pxl_out_16, pxl_out_17, pxl_out_18, pxl_out_19, pxl_out_20,
	                      pxl_out_21, pxl_out_22, pxl_out_23, pxl_out_24, pxl_out_25, pxl_out_26, pxl_out_27, pxl_out_28, pxl_out_29, pxl_out_30,
                        pxl_out_31, pxl_out_32,
                                              
		                    valid_out_1 , valid_out_2 , valid_out_3 , valid_out_4 , valid_out_5 , valid_out_6 , valid_out_7 , valid_out_8 , valid_out_9 , valid_out_10,
                        valid_out_11, valid_out_12, valid_out_13, valid_out_14, valid_out_15, valid_out_16, valid_out_17, valid_out_18, valid_out_19, valid_out_20,
	                      valid_out_21, valid_out_22, valid_out_23, valid_out_24, valid_out_25, valid_out_26, valid_out_27, valid_out_28, valid_out_29, valid_out_30,
                        valid_out_31, valid_out_32

	);

endmodule                      



