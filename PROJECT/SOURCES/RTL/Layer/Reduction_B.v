module Reduction_B
#(
  parameter DATA_WIDTH = 32
)
(  
  input clk, reset, valid_in,
  input [DATA_WIDTH-1:0] pxl_in,
	
	input [DATA_WIDTH-1:0] kernel_00_x1,
	
	input [DATA_WIDTH-1:0] kernel_00_x2, kernel_01_x2, kernel_02_x2,
	input [DATA_WIDTH-1:0] kernel_03_x2, kernel_04_x2, kernel_05_x2,
	input [DATA_WIDTH-1:0] kernel_06_x2, kernel_07_x2, kernel_08_x2,
	 
	input [DATA_WIDTH-1:0] kernel_00_x3,	
	
	input [DATA_WIDTH-1:0] kernel_00_x4, kernel_01_x4, kernel_02_x4,  
	input [DATA_WIDTH-1:0] kernel_03_x4, kernel_04_x4, kernel_05_x4, 
	input [DATA_WIDTH-1:0] kernel_06_x4, kernel_07_x4, kernel_08_x4, 
	
	input [DATA_WIDTH-1:0] kernel_00_x5,
		
	input [DATA_WIDTH-1:0] kernel_00_x6, kernel_01_x6, kernel_02_x6,  
	input [DATA_WIDTH-1:0] kernel_03_x6, kernel_04_x6, kernel_05_x6, 
	input [DATA_WIDTH-1:0] kernel_06_x6, kernel_07_x6, kernel_08_x6, 
			
	input [DATA_WIDTH-1:0] kernel_00_x7, kernel_01_x7, kernel_02_x7,  
	input [DATA_WIDTH-1:0] kernel_03_x7, kernel_04_x7, kernel_05_x7, 
	input [DATA_WIDTH-1:0] kernel_06_x7, kernel_07_x7, kernel_08_x7,
	
  output [DATA_WIDTH-1:0] pxl_out,
  output valid_out
);
  
  wire [DATA_WIDTH-1:0] out_max33,            
                        out_conv11_1, 
                        out_conv33_1,
                        out_conv11_2,
                        out_conv33_2,
                        out_conv11_3,    
                        out_conv33_3,
                        out_conv33_4;
                        
                   wire valid_max33,
                        valid_conv11_1, 
                        valid_conv33_1,
                        valid_conv11_2,
                        valid_conv33_2,
                        valid_conv11_3,    
                        valid_conv33_3,
                        valid_conv33_4; 

    //1   
  //max 33 (stride 2 V) input 17x17x1088 output 8x8x1088 
  max_33 #(17,DATA_WIDTH) x0( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  .pxl_out(out_max33),
                  .valid_out(valid_max33)
                  );
                  
       //2           
      //conv 11 (256)  input 17x17x1088 output 17x17x256      
   conv_11 #(17,DATA_WIDTH) x1( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  
                  .kernel_00(kernel_00_x1), 
                  
                  .pxl_out(out_conv11_1),
                  .valid_out(valid_conv11_1)
                  );
                  
     //conv 33 (384 stride 2 V) input 17x17x256 output 8x8x384
    conv_33_s2 #(17,DATA_WIDTH) x2( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv11_1),
                  .pxl_in(out_conv11_1),
                   
                		.kernel_00(kernel_00_x2), 
		              .kernel_01(kernel_01_x2), 
	               	.kernel_02(kernel_02_x2),
	               	.kernel_03(kernel_03_x2), 
	               	.kernel_04(kernel_04_x2), 
	               	.kernel_05(kernel_05_x2),
		              .kernel_06(kernel_06_x2), 
		              .kernel_07(kernel_07_x2), 
		              .kernel_08(kernel_08_x2),
		              
                  .pxl_out(out_conv33_1),
                  .valid_out(valid_conv33_1)
                  ); 
                   
  //3  
 //conv 11 (256)  input 17x17x1088 output 17x17x256          
   conv_11 #(17,DATA_WIDTH) x3( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  
                  .kernel_00(kernel_00_x3), 
                   
                  .pxl_out(out_conv11_2),
                  .valid_out(valid_conv11_2)
                  );   
                              
     //conv 33 (288 stride 2 V)  input 17x17x256  output 8x8x288     
   conv_33_s2 #(17,DATA_WIDTH) x4( .clk(clk),
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
		              
                  .pxl_out(out_conv33_2),
                  .valid_out(valid_conv33_2)
                  ); 
       
       //4           
      //conv 11 (256)  input 17x17x1152 output 17x17x256      
   conv_11 #(17,DATA_WIDTH) x5( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  
                  .kernel_00(kernel_00_x5), 
                   
                  .pxl_out(out_conv11_3),
                  .valid_out(valid_conv11_3)
                  );
                  
    //conv 33 (288)  input 17x17x256  output 17x17x288  
   conv_33_p #(17,DATA_WIDTH) x6( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv11_3),
                  .pxl_in(out_conv11_3),
                                                                         
                		.kernel_00(kernel_00_x6), 
		              .kernel_01(kernel_01_x6), 
	               	.kernel_02(kernel_02_x6),
	               	.kernel_03(kernel_03_x6), 
	               	.kernel_04(kernel_04_x6), 
	               	.kernel_05(kernel_05_x6),
		              .kernel_06(kernel_06_x6), 
		              .kernel_07(kernel_07_x6), 
		              .kernel_08(kernel_08_x6),
		            
                  .pxl_out(out_conv33_3),
                  .valid_out(valid_conv33_3)
                  ); 
                  
     //conv 33 (320 stride 2 V) input 17x17x288 output 8x8x320
    conv_33_s2 #(17,DATA_WIDTH) x7( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv33_3),
                  .pxl_in(out_conv33_3),
                                                                         
                		.kernel_00(kernel_00_x7), 
		              .kernel_01(kernel_01_x7), 
	               	.kernel_02(kernel_02_x7),
	               	.kernel_03(kernel_03_x7), 
	               	.kernel_04(kernel_04_x7), 
	               	.kernel_05(kernel_05_x7),
		              .kernel_06(kernel_06_x7), 
		              .kernel_07(kernel_07_x7), 
		              .kernel_08(kernel_08_x7),
		            
                  .pxl_out(out_conv33_4),
                  .valid_out(valid_conv33_4)
                  );
    //final                       
   //filter concat (merge 4input)   input 8x8x1088 8x8x384 8x8x288 8x8x320 output 8x8x2080 
      merge_4i #(8,1,1,1,1,DATA_WIDTH) x8(    .clk(clk),
                  .reset(reset),
                  .valid_in_1(valid_max33),
                  .valid_in_2(valid_conv33_1),
                  .valid_in_3(valid_conv33_2),
                  .valid_in_4(valid_conv33_4),
                  
                  .pxl_in_1(out_max33),
                  .pxl_in_2(out_conv33_1),
                  .pxl_in_3(out_conv33_2),
                  .pxl_in_4(out_conv33_4),
                  
                  .pxl_out(pxl_out),
                  .valid_out(valid_out)
                  ); 
                                  
endmodule




