`timescale 1ns / 1ps
// Convolution Kernel 3x3, Stride = 2, Padding = 0.

module tb_conv_33_s2;
  parameter data_width = 32;
  parameter D = 299;
  parameter T = D*D;
	parameter C = 10;
	parameter I = 20;
	integer i;
	
	reg clk;
	reg reset;
	reg valid_in;
	reg [data_width-1:0] pxl_in;
	
  reg [data_width-1:0] kernel_00, kernel_01, kernel_02;
	reg [data_width-1:0] kernel_03, kernel_04, kernel_05;
	reg [data_width-1:0] kernel_06, kernel_07, kernel_08;

	
	reg [data_width-1:0]In[T-1:0];
  reg [data_width-1:0]Out;
	
	wire [data_width-1:0] pxl_out;
	wire valid_out;
	
initial begin
 	clk = 0;
 	
 		//3x3test
 	/*kernel_00=32'd0;
 	kernel_01=32'd0;
 	kernel_02=32'd0;
 	
 	kernel_03=32'd0;
 	kernel_04=32'h3f800000; 	
 	kernel_05=32'd0;
 	
 	kernel_06=32'd0;
 	kernel_07=32'd0;
 	kernel_08=32'd0;*/
 	
 	//3x3
 	kernel_00=32'h3f800000;
 	kernel_01=32'h40000000;
 	kernel_02=32'h3f800000;
 	
 	kernel_03=32'd0;
 	kernel_04=32'd0; 	
 	kernel_05=32'd0;
 	
 	kernel_06=32'hbf800000;
 	kernel_07=32'hc0000000;
 	kernel_08=32'hbf800000;
 
  i=0;
	reset = 0;

  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In);
  Out = $fopen("E:/Drive/ICDesign_Seminar/Result/Text/Output_Conv_33_s2.txt");
	end 
	always #(C) clk = ~ clk;
	
always @(posedge clk) begin
  	valid_in = 1;
  pxl_in = In[i];
  #(I) i = i + 1;
  if(valid_out == 1)begin
    $fdisplay(Out,"%b",pxl_out);
  end
  if(i == (T*3)+3) begin
  $finish;
end
end

	conv_33_s2 #(D,data_width) uut (
		.clk(clk), 
		.reset(reset), 
		.valid_in(valid_in),
		.pxl_in(pxl_in),
		
		.kernel_00(kernel_00), 
		.kernel_01(kernel_01), 
		.kernel_02(kernel_02),
		.kernel_03(kernel_03), 
		.kernel_04(kernel_04), 
		.kernel_05(kernel_05),
		.kernel_06(kernel_06), 
		.kernel_07(kernel_07), 
		.kernel_08(kernel_08),
	
		.pxl_out(pxl_out),
		.valid_out(valid_out)

	);

endmodule








