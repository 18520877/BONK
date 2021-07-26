module Stem
#(
  parameter DATA_WIDTH = 32
)
(  
  input clk, reset, valid_in,
  input [DATA_WIDTH-1:0] pxl_in,
  
  input [DATA_WIDTH-1:0] kernel_00_x0, kernel_01_x0, kernel_02_x0,
	input [DATA_WIDTH-1:0] kernel_03_x0, kernel_04_x0, kernel_05_x0,
	input [DATA_WIDTH-1:0] kernel_06_x0, kernel_07_x0, kernel_08_x0,
	
	input [DATA_WIDTH-1:0] kernel_00_x1, kernel_01_x1, kernel_02_x1,
	input [DATA_WIDTH-1:0] kernel_03_x1, kernel_04_x1, kernel_05_x1,
	input [DATA_WIDTH-1:0] kernel_06_x1, kernel_07_x1, kernel_08_x1, 
	
	input [DATA_WIDTH-1:0] kernel_00_x2, kernel_01_x2, kernel_02_x2,
	input [DATA_WIDTH-1:0] kernel_03_x2, kernel_04_x2, kernel_05_x2,
	input [DATA_WIDTH-1:0] kernel_06_x2, kernel_07_x2, kernel_08_x2,
	 
	input [DATA_WIDTH-1:0] kernel_00_x4,
		
	input [DATA_WIDTH-1:0] kernel_00_x5, kernel_01_x5, kernel_02_x5,
	input [DATA_WIDTH-1:0] kernel_03_x5, kernel_04_x5, kernel_05_x5,
	input [DATA_WIDTH-1:0] kernel_06_x5, kernel_07_x5, kernel_08_x5,
	
  output [DATA_WIDTH-1:0] pxl_out,
  output valid_out
);  
  wire [DATA_WIDTH-1:0] out_conv33_1, 
                        out_conv33_2, 
                        out_conv33_3, 
                        out_max33_1,
                        out_conv11, 
                        out_conv33_4;
                        
                   wire valid_conv33_1, 
                        valid_conv33_2, 
                        valid_conv33_3, 
                        valid_max33_1,
                        valid_conv11, 
                        valid_conv33_4; 
                         

	    
  //conv 33 (32 stride 2 V) input 299x299x3 output 149x149x32
  conv_33_s2 #(299,DATA_WIDTH) x0( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  
                		.kernel_00(kernel_00_x0), 
		              .kernel_01(kernel_01_x0), 
	               	.kernel_02(kernel_02_x0),
	               	.kernel_03(kernel_03_x0), 
	               	.kernel_04(kernel_04_x0), 
	               	.kernel_05(kernel_05_x0),
		              .kernel_06(kernel_06_x0), 
		              .kernel_07(kernel_07_x0), 
		              .kernel_08(kernel_08_x0),
		              
                  .pxl_out(out_conv33_1),
                  .valid_out(valid_conv33_1)
                  );
                  
      //conv 33 (32 V)  input 149x149x32 output 147x147x32         
   conv_33 #(149,DATA_WIDTH) x1( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv33_1),
                  .pxl_in(out_conv33_1),
                                   
                		.kernel_00(kernel_00_x1), 
		              .kernel_01(kernel_01_x1), 
	               	.kernel_02(kernel_02_x1),
	               	.kernel_03(kernel_03_x1), 
	               	.kernel_04(kernel_04_x1), 
	               	.kernel_05(kernel_05_x1),
		              .kernel_06(kernel_06_x1), 
		              .kernel_07(kernel_07_x1), 
		              .kernel_08(kernel_08_x1),
		              
                  .pxl_out(out_conv33_2),
                  .valid_out(valid_conv33_2)
                  );
                  
     //conv 33 (64) input 147x147x32 output 147x147x64 
    conv_33_p #(147,DATA_WIDTH) x2( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv33_2),
                  .pxl_in(out_conv33_2),
                                                     
                		.kernel_00(kernel_00_x2), 
		              .kernel_01(kernel_01_x2), 
	               	.kernel_02(kernel_02_x2),
	               	.kernel_03(kernel_03_x2), 
	               	.kernel_04(kernel_04_x2), 
	               	.kernel_05(kernel_05_x2),
		              .kernel_06(kernel_06_x2), 
		              .kernel_07(kernel_07_x2), 
		              .kernel_08(kernel_08_x2),
		              
                  .pxl_out(out_conv33_3),
                  .valid_out(valid_conv33_3)
                  ); 
                   
     //max 33 (stride 2 V)  input 147x147x64 output 73x73x64           
    max_33 #(147,DATA_WIDTH) x3( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv33_3),
                  .pxl_in(out_conv33_3),
                  .pxl_out(out_max33_1),
                  .valid_out(valid_max33_1)
                  ); 
                  
                            
    //conv 11 (80)  input 73x73x64 output 73x73x80          
  conv_11 #(73,DATA_WIDTH) x4( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_max33_1),
                  .pxl_in(out_max33_1),
                  
                  .kernel_00(kernel_00_x4), 
                                  		
                  .pxl_out(out_conv11),
                  .valid_out(valid_conv11)
                  );
  
     //conv 33 (192 V)  input 73x73x80 output 71x71x192                       
  conv_33 #(73,DATA_WIDTH) x5( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv11),
                  .pxl_in(out_conv11),
                                                                       
                		.kernel_00(kernel_00_x5), 
		              .kernel_01(kernel_01_x5), 
	               	.kernel_02(kernel_02_x5),
	               	.kernel_03(kernel_03_x5), 
	               	.kernel_04(kernel_04_x5), 
	               	.kernel_05(kernel_05_x5),
		              .kernel_06(kernel_06_x5), 
		              .kernel_07(kernel_07_x5), 
		              .kernel_08(kernel_08_x5),
		            
                  .pxl_out(out_conv33_4),
                  .valid_out(valid_conv33_4)
                  ); 
     
                  
    //max 33 (stride 2 V)  input 71x71x192 output 35x35x192                                                                  
  max_33 #(71,DATA_WIDTH) x6( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv33_4),
                  .pxl_in(out_conv33_4),
                  .pxl_out(pxl_out),
                  .valid_out(valid_out)
                  ); 
                   

                                                               
endmodule