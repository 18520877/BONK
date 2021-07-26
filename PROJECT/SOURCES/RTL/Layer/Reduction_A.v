module Reduction_A
#(
  parameter DATA_WIDTH = 32
)
(  
  input clk, reset, valid_in,
  input [DATA_WIDTH-1:0] pxl_in,
	
	input [DATA_WIDTH-1:0] kernel_00_x1, kernel_01_x1, kernel_02_x1,
	input [DATA_WIDTH-1:0] kernel_03_x1, kernel_04_x1, kernel_05_x1,
	input [DATA_WIDTH-1:0] kernel_06_x1, kernel_07_x1, kernel_08_x1, 
	
	input [DATA_WIDTH-1:0] kernel_00_x2,
	 
	input [DATA_WIDTH-1:0] kernel_00_x3, kernel_01_x3, kernel_02_x3,
	input [DATA_WIDTH-1:0] kernel_03_x3, kernel_04_x3, kernel_05_x3,
	input [DATA_WIDTH-1:0] kernel_06_x3, kernel_07_x3, kernel_08_x3,	
	
	input [DATA_WIDTH-1:0] kernel_00_x4, kernel_01_x4, kernel_02_x4,  
	input [DATA_WIDTH-1:0] kernel_03_x4, kernel_04_x4, kernel_05_x4, 
	input [DATA_WIDTH-1:0] kernel_06_x4, kernel_07_x4, kernel_08_x4,
	
  output [DATA_WIDTH-1:0] pxl_out,
  output valid_out
);
  wire [DATA_WIDTH-1:0]  out_max33, 
                        out_conv33_1,
                        out_conv11,
                        out_conv33_2,    
                        out_conv33_3;
                        
                   wire valid_max33, 
                        valid_conv33_1,
                        valid_conv11,
                        valid_conv33_2,    
                        valid_conv33_3; 
                           
    //1    
  //max 33 (stride 2 V) input 35x35x320 output 17x17x320
  max_33 #(35,DATA_WIDTH) x0( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  .pxl_out(out_max33),
                  .valid_out(valid_max33)
                  );
      
      //2            
      //conv 33 (384 stride 2 V)  input 35x35x320 output 17x17x384      
   conv_33_s2 #(35,DATA_WIDTH) x1( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                                  
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
      
      //3            
     //conv 11 (256) input 35x35x320 output 35x35x256
    conv_11 #(35,DATA_WIDTH) x2( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  
                  .kernel_00(kernel_00_x2), 
                  
                  .pxl_out(out_conv11),
                  .valid_out(valid_conv11)
                  ); 
                   
    
 //conv 33 (256)  input 35x35x256 output 35x35x256         
   conv_33_p #(35,DATA_WIDTH) x3( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv11),
                  .pxl_in(out_conv11),
                                                       
                		.kernel_00(kernel_00_x3), 
		              .kernel_01(kernel_01_x3), 
	               	.kernel_02(kernel_02_x3),
	               	.kernel_03(kernel_03_x3), 
	               	.kernel_04(kernel_04_x3), 
	               	.kernel_05(kernel_05_x3),
		              .kernel_06(kernel_06_x3), 
		              .kernel_07(kernel_07_x3), 
		              .kernel_08(kernel_08_x3),
		              
                  .pxl_out(out_conv33_2),
                  .valid_out(valid_conv33_2)
                  );   
                              
     //conv 33 (384 stride 2 V)  input 35x35x256  output 17x17x384    
   conv_33_s2 #(35,DATA_WIDTH) x4( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv33_2),
                  .pxl_in(out_conv33_2),
                              	                                     
                		.kernel_00(kernel_00_x4), 
		              .kernel_01(kernel_01_x4), 
	               	.kernel_02(kernel_02_x4),
	               	.kernel_03(kernel_03_x4), 
	               	.kernel_04(kernel_04_x4), 
	               	.kernel_05(kernel_05_x4),
		              .kernel_06(kernel_06_x4), 
		              .kernel_07(kernel_07_x4), 
		              .kernel_08(kernel_08_x4),
		               
                  .pxl_out(out_conv33_3),
                  .valid_out(valid_conv33_3)
                  ); 
    
    //final       
   //filter concat (merge 3input)  input 17x17x320+384+384 output 17x17x1088
      merge_3i #(17,1,1,1,DATA_WIDTH) x5(    .clk(clk),
                  .reset(reset),
                  .valid_in_1(valid_max33),
                  .valid_in_2(valid_conv33_1),
                  .valid_in_3(valid_conv33_3),
                  
                  .pxl_in_1(out_max33),
                  .pxl_in_2(out_conv33_1),
                  .pxl_in_3(out_conv33_3),
                  
                  .pxl_out(pxl_out),
                  .valid_out(valid_out)
                  ); 
                                  
endmodule


