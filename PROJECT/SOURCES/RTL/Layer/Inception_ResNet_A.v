module Inception_Resnet_A
#(
  parameter DATA_WIDTH = 32
)
(  
  input clk, reset, valid_in,
  input [DATA_WIDTH-1:0] pxl_in,
  
  input [DATA_WIDTH-1:0] kernel_00_x0,
	
	input [DATA_WIDTH-1:0] kernel_00_x1, 
	
	input [DATA_WIDTH-1:0] kernel_00_x2, kernel_01_x2, kernel_02_x2,
	input [DATA_WIDTH-1:0] kernel_03_x2, kernel_04_x2, kernel_05_x2,
	input [DATA_WIDTH-1:0] kernel_06_x2, kernel_07_x2, kernel_08_x2,
	 
	input [DATA_WIDTH-1:0] kernel_00_x3,
		
	input [DATA_WIDTH-1:0] kernel_00_x4, kernel_01_x4, kernel_02_x4,  
	input [DATA_WIDTH-1:0] kernel_03_x4, kernel_04_x4, kernel_05_x4, 
	input [DATA_WIDTH-1:0] kernel_06_x4, kernel_07_x4, kernel_08_x4, 
		
	input [DATA_WIDTH-1:0] kernel_00_x5, kernel_01_x5, kernel_02_x5,
	input [DATA_WIDTH-1:0] kernel_03_x5, kernel_04_x5, kernel_05_x5,
	input [DATA_WIDTH-1:0] kernel_06_x5, kernel_07_x5, kernel_08_x5,
	 
	input [DATA_WIDTH-1:0] kernel_00_x7,
	
  output [DATA_WIDTH-1:0] pxl_out,
  output valid_out
); 
  wire [DATA_WIDTH-1:0] out_merge, 
                        out_conv11_1,
                        out_conv11_2,
                        out_conv11_3, 
                        out_conv33_1,
                        out_conv33_2,
                        out_conv33_3,    
                        out_conv11_4;
                        
                   wire valid_merge, 
                        valid_conv11_1,
                        valid_conv11_2, 
                        valid_conv11_3,  
                        valid_conv33_1,
                        valid_conv33_2,
                        valid_conv33_3,    
                        valid_conv11_4;  

   //1     
  //conv 11 (32) input 35x35x320 output 35x35x32
  conv_11 #(35,DATA_WIDTH) x0( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  
                  .kernel_00(kernel_00_x0), 
                  
                  .pxl_out(out_conv11_1),
                  .valid_out(valid_conv11_1)
                  );
    
    //2              
   //conv 11 (32) input 35x35x320 output 35x35x32
  conv_11 #(35,DATA_WIDTH) x1( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  
                  .kernel_00(kernel_00_x1), 
                  
                  .pxl_out(out_conv11_2),
                  .valid_out(valid_conv11_2)
                  );                 
      //conv 33 (32)  input 35x35x32 output 35x35x32        
   conv_33_p #(35,DATA_WIDTH) x2( .clk(clk),
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
		              .kernel_07(kernel_07_x2), 
		              .kernel_08(kernel_08_x2),
		              
                  .pxl_out(out_conv33_1),
                  .valid_out(valid_conv33_1)
                  );
   
   //3               
  //conv 11 (32) input 35x35x320 output 35x35x32
  conv_11 #(35,DATA_WIDTH) x3( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  
                  .kernel_00(kernel_00_x3), 
                           
                  .pxl_out(out_conv11_3),
                  .valid_out(valid_conv11_3)
                  );            
     //conv 33 (48) input 35x35x32 output 35x35x48
    conv_33_p #(35,DATA_WIDTH) x4( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv11_3),
                                                        
                		.kernel_00(kernel_00_x4), 
		              .kernel_01(kernel_01_x4), 
	               	.kernel_02(kernel_02_x4),
	               	.kernel_03(kernel_03_x4), 
	               	.kernel_04(kernel_04_x4), 
	               	.kernel_05(kernel_05_x4),
		              .kernel_06(kernel_06_x4), 
		              .kernel_07(kernel_07_x4), 
		              .kernel_08(kernel_08_x4),
		              
                  .pxl_in(out_conv11_3),
                  .pxl_out(out_conv33_2),
                  .valid_out(valid_conv33_2)
                  ); 
                   
    
 //conv 33 (64)  input 35x35x48 output 35x35x64         
   conv_33_p #(35,DATA_WIDTH) x5( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv33_2),
                  .pxl_in(out_conv33_2),
                                                                        
                		.kernel_00(kernel_00_x5), 
		              .kernel_01(kernel_01_x5), 
	               	.kernel_02(kernel_02_x5),
	               	.kernel_03(kernel_03_x5), 
	               	.kernel_04(kernel_04_x5), 
	               	.kernel_05(kernel_05_x5),
		              .kernel_06(kernel_06_x5), 
		              .kernel_07(kernel_07_x5), 
		              .kernel_08(kernel_08_x5),
		            
                  .pxl_out(out_conv33_3),
                  .valid_out(valid_conv33_3)
                  );   
                              
   
 
  //conv 11 linear: merge -> conv11                          
   // *merging layer 3 input*input1 35x35x32 input2 35x35x32 input3 35x35x64 output 35x35x128 
     merge_3i #(35,1,1,1,DATA_WIDTH) x6(    .clk(clk),
                  .reset(reset),
                  .valid_in_1(valid_conv11_1),
                  .valid_in_2(valid_conv33_1),
                  .valid_in_3(valid_conv33_3),
                  
                  .pxl_in_1(out_conv11_1),
                  .pxl_in_2(out_conv33_1),
                  .pxl_in_3(out_conv33_3),
                  
                  .pxl_out(out_merge),
                  .valid_out(valid_merge)
                  );
                  
    //conv 11 (320)  input 35x35x128 output 35x35x320         
  conv_11 #(35,DATA_WIDTH) x7( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_merge),
                  .pxl_in(out_merge),
                                                                          
                		.kernel_00(kernel_00_x7), 
                		
                  .pxl_out(out_conv11_4),
                  .valid_out(valid_conv11_4)
                  );
                  
     //mach cong 35x35x320 lambda                    
  add_layer #(35,DATA_WIDTH) x8( .clk(clk),
                  .reset(reset),
                  .valid_in_1(valid_in),               
                  .valid_in_2(valid_conv11_4),
                  
                  .pxl_in_1(pxl_in),
                  .pxl_in_2(out_conv11_4),
                  
                  .pxl_out(pxl_out),
                  .valid_out(valid_out)
                  );                
                                   
endmodule


