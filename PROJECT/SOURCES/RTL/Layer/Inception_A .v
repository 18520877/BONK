module Inception_A
#(
  parameter DATA_WIDTH = 32
)
(  
  input clk, reset, valid_in,
  input [DATA_WIDTH-1:0] pxl_in,
  
  input [DATA_WIDTH-1:0] kernel_00_x0,
	
	input [DATA_WIDTH-1:0] kernel_00_x1, kernel_01_x1, kernel_02_x1,
	input [DATA_WIDTH-1:0] kernel_03_x1, kernel_04_x1, kernel_05_x1,
	input [DATA_WIDTH-1:0] kernel_06_x1, kernel_07_x1, kernel_08_x1, 
	
	input [DATA_WIDTH-1:0] kernel_00_x2, kernel_01_x2, kernel_02_x2,
	input [DATA_WIDTH-1:0] kernel_03_x2, kernel_04_x2, kernel_05_x2,
	input [DATA_WIDTH-1:0] kernel_06_x2, kernel_07_x2, kernel_08_x2,
	 
	input [DATA_WIDTH-1:0] kernel_00_x3,
	
	input [DATA_WIDTH-1:0] kernel_00_x4, kernel_01_x4, kernel_02_x4, kernel_03_x4, kernel_04_x4, 
	input [DATA_WIDTH-1:0] kernel_05_x4, kernel_06_x4, kernel_07_x4, kernel_08_x4, kernel_09_x4,
	input [DATA_WIDTH-1:0] kernel_10_x4, kernel_11_x4, kernel_12_x4, kernel_13_x4, kernel_14_x4, 
	input [DATA_WIDTH-1:0] kernel_15_x4, kernel_16_x4, kernel_17_x4, kernel_18_x4, kernel_19_x4,	
	input [DATA_WIDTH-1:0] kernel_20_x4, kernel_21_x4, kernel_22_x4, kernel_23_x4, kernel_24_x4,
	
	input [DATA_WIDTH-1:0] kernel_00_x5,
	
	input [DATA_WIDTH-1:0] kernel_00_x7,
	
  output [DATA_WIDTH-1:0] pxl_out,
  output valid_out
);  
  wire [DATA_WIDTH-1:0] out_conv11_1,
                        out_conv33_1, 
                        out_conv33_2,  
                        
                        out_conv11_2,
                        out_conv55,
                         
                        out_conv11_3,
                               
                        out_avg33,
                        out_conv11_4;
                        
                   wire valid_conv11_1,
                        valid_conv33_1, 
                        valid_conv33_2,  
                        
                        valid_conv11_2,
                        valid_conv55,
                         
                        valid_conv11_3,
                               
                        valid_avg33,
                        valid_conv11_4;
     //branch1                    
    //conv 11 (64)  input 35x35x192 output 35x35x64          
  conv_11 #(35,DATA_WIDTH) x0( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  
                  .kernel_00(kernel_00_x0), 
                                  		
                  .pxl_out(out_conv11_1),
                  .valid_out(valid_conv11_1)
                  );
	    
  //conv 33 (96) input 35x35x64 output 35x35x96
  conv_33_p #(35,DATA_WIDTH) x1( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv11_1),
                  .pxl_in(out_conv11_1),
                  
                		.kernel_00(kernel_00_x1), 
		              .kernel_01(kernel_01_x1), 
	               	.kernel_02(kernel_02_x1),
	               	.kernel_03(kernel_03_x1), 
	               	.kernel_04(kernel_04_x1), 
	               	.kernel_05(kernel_05_x1),
		              .kernel_06(kernel_06_x1), 
		              .kernel_07(kernel_07_x1), 
		              .kernel_08(kernel_08_x1),
		              
                  .pxl_out(out_conv33_1),
                  .valid_out(valid_conv33_1)
                  );
                  
    //conv 33 (96) input 35x35x96 output 35x35x96
  conv_33_p #(35,DATA_WIDTH) x2( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv33_1),
                  .pxl_in(out_conv33_1),
                  
                		.kernel_00(kernel_00_x2), 
		              .kernel_01(kernel_01_x2), 
	               	.kernel_02(kernel_02_x2),
	               	.kernel_03(kernel_03_x2), 
	               	.kernel_04(kernel_04_x2), 
	               	.kernel_05(kernel_05_x2),
		              .kernel_06(kernel_06_x2), 
		              .kernel_07(kernel_07_x2), 
		              .kernel_08(kernel_08_x2),
		              
                  .pxl_out(out_conv33_2),
                  .valid_out(valid_conv33_2)
                  );
        //branch2                      
         //conv 11 (48)  input 35x35x192 output 35x35x48          
  conv_11 #(35,DATA_WIDTH) x3( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  
                  .kernel_00(kernel_00_x3), 
                                  		
                  .pxl_out(out_conv11_2),
                  .valid_out(valid_conv11_2)
                  );
                  
     //conv 55 (64) input 35x35x48 output 35x35x64
    conv_55_p #(35,DATA_WIDTH) x4( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv11_2),
                  .pxl_in(out_conv11_2),
                                                     
                		.kernel_00(kernel_00_x4), 
		              .kernel_01(kernel_01_x4), 
	               	.kernel_02(kernel_02_x4),
	               	.kernel_03(kernel_03_x4), 
	               	.kernel_04(kernel_04_x4), 
	               	.kernel_05(kernel_05_x4),
		              .kernel_06(kernel_06_x4), 
		              .kernel_07(kernel_07_x4), 
		              .kernel_08(kernel_08_x4),
		              .kernel_09(kernel_09_x4), 
		              .kernel_10(kernel_10_x4), 
	               	.kernel_11(kernel_11_x4),
	               	.kernel_12(kernel_12_x4), 
	               	.kernel_13(kernel_13_x4), 
	               	.kernel_14(kernel_14_x4),
		              .kernel_15(kernel_15_x4), 
		              .kernel_16(kernel_16_x4), 
		              .kernel_17(kernel_17_x4),
		              .kernel_18(kernel_18_x4), 
		              .kernel_19(kernel_19_x4), 
	               	.kernel_20(kernel_20_x4),
	               	.kernel_21(kernel_21_x4), 
	               	.kernel_22(kernel_22_x4), 
	               	.kernel_23(kernel_23_x4),
		              .kernel_24(kernel_24_x4), 

		              
                  .pxl_out(out_conv55),
                  .valid_out(valid_conv55)
                  );
                  
      //branch3                     
     //conv 11 (96)  input 35x35x192 output 35x35x96          
  conv_11 #(35,DATA_WIDTH) x5( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  
                  .kernel_00(kernel_00_x5), 
                                  		
                  .pxl_out(out_conv11_3),
                  .valid_out(valid_conv11_3)
                  ); 
      
      //branch4            
     //avg 33 (stride 1 V,padding 2)  input 35x35x192 output 35x35x192           
    avg_33_p #(35,DATA_WIDTH) x6( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  .pxl_out(out_avg33),
                  .valid_out(valid_avg33)
                  ); 
                  
                            
    //conv 11 (64)  input 35x35x192 output 35x35x64          
  conv_11 #(35,DATA_WIDTH) x7( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_avg33),
                  .pxl_in(out_avg33),
                  
                  .kernel_00(kernel_00_x7), 
                                  		
                  .pxl_out(out_conv11_4),
                  .valid_out(valid_conv11_4)
                  );
  
     //filter concat (merge 4input)  input 35x35x96+64+96+64 output 35x35x320 
      merge_4i #(35,1,1,1,1,DATA_WIDTH) x8(    
                  .clk(clk),
                  .reset(reset),
                  
                  .valid_in_1(valid_conv33_2),
                  .valid_in_2(valid_conv55),
                  .valid_in_3(valid_conv11_3),
                  .valid_in_4(valid_conv11_4),
                  
                  .pxl_in_1(out_conv33_2),
                  .pxl_in_2(out_conv55),
                  .pxl_in_3(out_conv11_3),
                  .pxl_in_4(out_conv11_4),
                  
                  .pxl_out(pxl_out),
                  .valid_out(valid_out)
                  );    

                                                               
endmodule
