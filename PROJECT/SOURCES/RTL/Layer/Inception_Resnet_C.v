module Inception_Resnet_C
#(
  parameter DATA_WIDTH = 32
)
(  
  input clk, reset, valid_in,
  input [DATA_WIDTH-1:0] pxl_in,
  
  input [DATA_WIDTH-1:0] kernel_00_x0,
	
	input [DATA_WIDTH-1:0] kernel_00_x1, 
	
	input [DATA_WIDTH-1:0] kernel_00_x2, kernel_01_x2, kernel_02_x2, 
	 
	input [DATA_WIDTH-1:0] kernel_00_x3, kernel_03_x3, kernel_06_x3,
		
	input [DATA_WIDTH-1:0] kernel_00_x5,
	
  output [DATA_WIDTH-1:0] pxl_out,
  output valid_out
); 
  wire [DATA_WIDTH-1:0] out_merge, 
                        out_conv11_1,
                        out_conv11_2,
                        out_conv13,
                        out_conv31,
                        out_conv11_3;
                        
                   wire valid_merge, 
                        valid_conv11_1,
                        valid_conv11_2, 
                        valid_conv13,
                        valid_conv31,
                        valid_conv11_3;   

   //1     
  //conv 11 (192) input 8x8x2080 output 8x8x192
  conv_11 #(8,DATA_WIDTH)x0( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  
                  .kernel_00(kernel_00_x0), 
                  
                  .pxl_in(pxl_in),
                  .pxl_out(out_conv11_1),
                  .valid_out(valid_conv11_1)
                  );
    //2              
   //conv 11 (192) input 8x8x2080  output 8x8x192
  conv_11 #(8,DATA_WIDTH) x1( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  
                  .kernel_00(kernel_00_x1), 
                  
                  .pxl_out(out_conv11_2),
                  .valid_out(valid_conv11_2)
                  );                 
      //conv 13 (224)  input 8x8x192 output 8x8x224      
   conv_13_p #(8,DATA_WIDTH) x2( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv11_2),
                  .pxl_in(out_conv11_2),
                  
                 	.kernel_00(kernel_00_x2), 
		              .kernel_01(kernel_01_x2), 
	               	.kernel_02(kernel_02_x2),
		              
                  .pxl_out(out_conv13),
                  .valid_out(valid_conv13)
                  );
                  
  //conv 31 (256) input 8x8x224 output 8x8x256
  conv_31_p #(8,DATA_WIDTH) x3( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv13),
                  .pxl_in(out_conv13),
                           	                                      
                		.kernel_00(kernel_00_x3), 
		              .kernel_03(kernel_03_x3), 
	               	.kernel_06(kernel_06_x3),
		              
                  .pxl_out(out_conv31),
                  .valid_out(valid_conv31)
                  );             
   
    //conv 11 (2080  Linear)  input1 8x8x192 input2 8x8x256 output 8x8x2080          
    //conv 11 linear: merge -> conv11                          
   //merging layer 2 input input1 8x8x192 input2 8x8x256 output 8x8x448 
     merge_2i #(8,1,1,DATA_WIDTH) x4(    .clk(clk),
                  .reset(reset),
                  .valid_in_1(valid_conv11_1),
                  .valid_in_2(valid_conv31),
                  
                  .pxl_in_1(out_conv11_1),
                  .pxl_in_2(out_conv31),
                  
                  .pxl_out(out_merge),
                  .valid_out(valid_merge)
                  );
                  
    //conv 11 (1088)  input 8x8x448   output   8x8x2080         
  conv_11 #(8,DATA_WIDTH) x5( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_merge),
                  .pxl_in(out_merge),
                           	                                      
                		.kernel_00(kernel_00_x5),
                		
                  .pxl_out(out_conv11_3),
                  .valid_out(valid_conv11_3)
                  ); 
                                
     //mach cong 8x8x2080                     
   add_layer #(8,DATA_WIDTH) x6( .clk(clk),
                  .reset(reset),
                  .valid_in_1(valid_in),               
                  .valid_in_2(valid_conv11_3),
                  
                  .pxl_in_1(pxl_in),
                  .pxl_in_2(out_conv11_3),
                  
                  .pxl_out(pxl_out),
                  .valid_out(valid_out)
                  );
                               
                                   
endmodule






