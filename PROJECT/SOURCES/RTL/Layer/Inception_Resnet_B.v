module Inception_Resnet_B
#(
  parameter DATA_WIDTH = 32
)
(  
  input clk, reset, valid_in,
  input [DATA_WIDTH-1:0] pxl_in,
  
  input [DATA_WIDTH-1:0] kernel_00_x0,
	
	input [DATA_WIDTH-1:0] kernel_00_x1, 
	
	input [DATA_WIDTH-1:0] kernel_00_x2, kernel_01_x2, kernel_02_x2, kernel_03_x2, kernel_04_x2, kernel_05_x2, kernel_06_x2,
	 
	input [DATA_WIDTH-1:0] kernel_00_x3, kernel_03_x3, kernel_06_x3, kernel_09_x3, kernel_12_x3, kernel_15_x3, kernel_18_x3,
		
	input [DATA_WIDTH-1:0] kernel_00_x5,
	
  output [DATA_WIDTH-1:0] pxl_out,
  output valid_out
); 
  wire [DATA_WIDTH-1:0] out_merge, 
                        out_conv11_1,
                        out_conv11_2,
                        out_conv11_3, 
                        out_conv17,
                        out_conv71;
                        
                   wire valid_merge, 
                        valid_conv11_1,
                        valid_conv11_2, 
                        valid_conv11_3,  
                        valid_conv17,
                        valid_conv71;  
 /* relu x0(
      .clk(clk),
      .en(en),
      .din_relu(pxl_in),
      .dout_relu(out_relu),
      .valid(valid_relu)
    );*/
   //1     
  //conv 11 (192) input 17x17x1088 output 17x17x192
  conv_11 #(17,DATA_WIDTH) x0( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  
                  .kernel_00(kernel_00_x0), 
                  
                  .pxl_in(pxl_in),
                  .pxl_out(out_conv11_1),
                  .valid_out(valid_conv11_1)
                  );
    //2              
   //conv 11 (128) input 17x17x1088 output 17x17x128
  conv_11 #(17,DATA_WIDTH) x1( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  
                  .kernel_00(kernel_00_x1), 
                  
                  .pxl_out(out_conv11_2),
                  .valid_out(valid_conv11_2)
                  );                 
      //conv 17 (160)  input 17x17x128 output 17x17x160        
   conv_17_p #(17,DATA_WIDTH) x2( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv11_2),
                  .pxl_in(out_conv11_2),
                  
                 	.kernel_00(kernel_00_x2), 
		              .kernel_01(kernel_01_x2), 
	               	.kernel_02(kernel_02_x2),
	               	.kernel_03(kernel_03_x2), 
	               	.kernel_04(kernel_04_x2), 
	               	.kernel_05(kernel_05_x2),
		              .kernel_06(kernel_06_x2),
		              
                  .pxl_out(out_conv17),
                  .valid_out(valid_conv17)
                  );
                  
  //conv 71 (192) input 17x17x160 output 17x17x192
  conv_71_p #(17,DATA_WIDTH) x3( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv17),
                  .pxl_in(out_conv17),
                           	                                      
                		.kernel_00(kernel_00_x3), 
		              .kernel_03(kernel_03_x3), 
	               	.kernel_06(kernel_06_x3),
	               	.kernel_09(kernel_09_x3), 
	               	.kernel_12(kernel_12_x3), 
	               	.kernel_15(kernel_15_x3),
		              .kernel_18(kernel_18_x3),
		              
                  .pxl_out(out_conv71),
                  .valid_out(valid_conv71)
                  );            
   
    //conv 11 (1088 Linear)  input1 17x17x192 input2 17x17x192 output 17x17x1088       
      //conv 11 linear: merge -> conv11                          
   //merging layer 2 input input1 17x17x192 input2 17x17x192 output 17x17x384  
     merge_2i #(17,1,1,DATA_WIDTH) x4(    .clk(clk),
                  .reset(reset),
                  .valid_in_1(valid_conv11_1),
                  .valid_in_2(valid_conv71),
                  .pxl_in_1(out_conv11_1),
                  .pxl_in_2(out_conv71),
                  .pxl_out(out_merge),
                  .valid_out(valid_merge)
                  );
                  
    //conv 11 (1088)  input 17x17x384   output   17x17x1088         
  conv_11 #(17,DATA_WIDTH) x5( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_merge),
                  .pxl_in(out_merge),
                           	                                      
                		.kernel_00(kernel_00_x5),
                		
                  .pxl_out(out_conv11_3),
                  .valid_out(valid_conv11_3)
                  );  
                             
     //mach cong 17x17x1088                    
   add_layer #(17,DATA_WIDTH) x6( .clk(clk),
                  .reset(reset),
                  .valid_in_1(valid_in),               
                  .valid_in_2(valid_conv11_3),
                  .pxl_in_1(pxl_in),
                  .pxl_in_2(out_conv11_3),
                  .pxl_out(pxl_out),
                  .valid_out(valid_out)
                  );                 
                
                                   
endmodule




