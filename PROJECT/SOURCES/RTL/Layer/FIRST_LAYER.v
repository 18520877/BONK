// Convolution Kernel 3x3, Stride = 2, Padding = 0, Channel = 32.
// Convolution Kernel 3x3, Stride = 1, Padding = 0, Channel = 32.
//Input = 299x299x3, Output = 147x147x32.

module FIRST_LAYER
#(parameter D = 220,
  parameter DATA_WIDTH = 32)
(
     //input
    	input clk,
    	input reset,
    	input valid_in_1, valid_in_2, valid_in_3,
    	input [DATA_WIDTH-1:0] pxl_in_1, pxl_in_2, pxl_in_3,
    
     output [DATA_WIDTH-1:0] pxl_out_1 , pxl_out_2 , pxl_out_3 , pxl_out_4 , pxl_out_5 , pxl_out_6 , pxl_out_7 , pxl_out_8 , pxl_out_9 , pxl_out_10,
                             pxl_out_11, pxl_out_12, pxl_out_13, pxl_out_14, pxl_out_15, pxl_out_16, pxl_out_17, pxl_out_18, pxl_out_19, pxl_out_20,
	                           pxl_out_21, pxl_out_22, pxl_out_23, pxl_out_24, pxl_out_25, pxl_out_26, pxl_out_27, pxl_out_28, pxl_out_29, pxl_out_30,
                          	  pxl_out_31, pxl_out_32,
                          	  
                 output valid_out_1 , valid_out_2 , valid_out_3 , valid_out_4 , valid_out_5 , valid_out_6 , valid_out_7 , valid_out_8 , valid_out_9 , valid_out_10,
                        valid_out_11, valid_out_12, valid_out_13, valid_out_14, valid_out_15, valid_out_16, valid_out_17, valid_out_18, valid_out_19, valid_out_20,
	                      valid_out_21, valid_out_22, valid_out_23, valid_out_24, valid_out_25, valid_out_26, valid_out_27, valid_out_28, valid_out_29, valid_out_30,
                        valid_out_31, valid_out_32
                        
);

wire [DATA_WIDTH-1:0] tmp_pxl_out_1,tmp_pxl_out_2,tmp_pxl_out_3,tmp_pxl_out_4,tmp_pxl_out_5,tmp_pxl_out_6,tmp_pxl_out_7,tmp_pxl_out_8,tmp_pxl_out_9,
                      tmp_pxl_out_10,tmp_pxl_out_11,tmp_pxl_out_12,tmp_pxl_out_13,tmp_pxl_out_14,tmp_pxl_out_15,tmp_pxl_out_16,tmp_pxl_out_17,tmp_pxl_out_18,
                      tmp_pxl_out_19,tmp_pxl_out_20,tmp_pxl_out_21,tmp_pxl_out_22,tmp_pxl_out_23,tmp_pxl_out_24,tmp_pxl_out_25,tmp_pxl_out_26,tmp_pxl_out_27,
                      tmp_pxl_out_28,tmp_pxl_out_29,tmp_pxl_out_30,tmp_pxl_out_31,tmp_pxl_out_32;
                      
wire tmp_valid_out_1,tmp_valid_out_2,tmp_valid_out_3,tmp_valid_out_4,tmp_valid_out_5,tmp_valid_out_6,tmp_valid_out_7,tmp_valid_out_8,tmp_valid_out_9,
     tmp_valid_out_10,tmp_valid_out_11,tmp_valid_out_12,tmp_valid_out_13,tmp_valid_out_14,tmp_valid_out_15,tmp_valid_out_16,tmp_valid_out_17,tmp_valid_out_18,
     tmp_valid_out_19,tmp_valid_out_20,tmp_valid_out_21,tmp_valid_out_22,tmp_valid_out_23,tmp_valid_out_24,tmp_valid_out_25,tmp_valid_out_26,tmp_valid_out_27,
     tmp_valid_out_28,tmp_valid_out_29,tmp_valid_out_30,tmp_valid_out_31,tmp_valid_out_32;
                           
CONV_3x3_Stride2_32 #(D,DATA_WIDTH) uut1 
(
		clk, 
		reset, 
		
		valid_in_1, valid_in_2, valid_in_3,
		pxl_in_1, pxl_in_2, pxl_in_3,
		
                      tmp_pxl_out_1,tmp_pxl_out_2,tmp_pxl_out_3,tmp_pxl_out_4,tmp_pxl_out_5,tmp_pxl_out_6,tmp_pxl_out_7,tmp_pxl_out_8,tmp_pxl_out_9,
                      tmp_pxl_out_10,tmp_pxl_out_11,tmp_pxl_out_12,tmp_pxl_out_13,tmp_pxl_out_14,tmp_pxl_out_15,tmp_pxl_out_16,tmp_pxl_out_17,tmp_pxl_out_18,
                      tmp_pxl_out_19,tmp_pxl_out_20,tmp_pxl_out_21,tmp_pxl_out_22,tmp_pxl_out_23,tmp_pxl_out_24,tmp_pxl_out_25,tmp_pxl_out_26,tmp_pxl_out_27,
                      tmp_pxl_out_28,tmp_pxl_out_29,tmp_pxl_out_30,tmp_pxl_out_31,tmp_pxl_out_32,
	                                 
     tmp_valid_out_1,tmp_valid_out_2,tmp_valid_out_3,tmp_valid_out_4,tmp_valid_out_5,tmp_valid_out_6,tmp_valid_out_7,tmp_valid_out_8,tmp_valid_out_9,
     tmp_valid_out_10,tmp_valid_out_11,tmp_valid_out_12,tmp_valid_out_13,tmp_valid_out_14,tmp_valid_out_15,tmp_valid_out_16,tmp_valid_out_17,tmp_valid_out_18,
     tmp_valid_out_19,tmp_valid_out_20,tmp_valid_out_21,tmp_valid_out_22,tmp_valid_out_23,tmp_valid_out_24,tmp_valid_out_25,tmp_valid_out_26,tmp_valid_out_27,
     tmp_valid_out_28,tmp_valid_out_29,tmp_valid_out_30,tmp_valid_out_31,tmp_valid_out_32

	);
	
CONV_3x3_Stride1_32 #(D,DATA_WIDTH) uut2
(
  	                     clk,
   	                    reset,
   	                    
     tmp_valid_out_1,tmp_valid_out_2,tmp_valid_out_3,tmp_valid_out_4,tmp_valid_out_5,tmp_valid_out_6,tmp_valid_out_7,tmp_valid_out_8,tmp_valid_out_9,
     tmp_valid_out_10,tmp_valid_out_11,tmp_valid_out_12,tmp_valid_out_13,tmp_valid_out_14,tmp_valid_out_15,tmp_valid_out_16,tmp_valid_out_17,tmp_valid_out_18,
     tmp_valid_out_19,tmp_valid_out_20,tmp_valid_out_21,tmp_valid_out_22,tmp_valid_out_23,tmp_valid_out_24,tmp_valid_out_25,tmp_valid_out_26,tmp_valid_out_27,
     tmp_valid_out_28,tmp_valid_out_29,tmp_valid_out_30,tmp_valid_out_31,tmp_valid_out_32,
            
                      tmp_pxl_out_1,tmp_pxl_out_2,tmp_pxl_out_3,tmp_pxl_out_4,tmp_pxl_out_5,tmp_pxl_out_6,tmp_pxl_out_7,tmp_pxl_out_8,tmp_pxl_out_9,
                      tmp_pxl_out_10,tmp_pxl_out_11,tmp_pxl_out_12,tmp_pxl_out_13,tmp_pxl_out_14,tmp_pxl_out_15,tmp_pxl_out_16,tmp_pxl_out_17,tmp_pxl_out_18,
                      tmp_pxl_out_19,tmp_pxl_out_20,tmp_pxl_out_21,tmp_pxl_out_22,tmp_pxl_out_23,tmp_pxl_out_24,tmp_pxl_out_25,tmp_pxl_out_26,tmp_pxl_out_27,
                      tmp_pxl_out_28,tmp_pxl_out_29,tmp_pxl_out_30,tmp_pxl_out_31,tmp_pxl_out_32,
    
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

