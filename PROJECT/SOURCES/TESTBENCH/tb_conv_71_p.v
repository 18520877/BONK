`timescale 1ns / 1ps
// Convolution Kernel 7x1, Stride = 1, Padding = 3 Custom.

module tb_conv_71_p;
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

	reg [data_width-1:0] kernel_00, kernel_03; 
	reg [data_width-1:0] kernel_06, kernel_09;
	reg [data_width-1:0] kernel_12; 
	reg [data_width-1:0] kernel_15, kernel_18;	
	
	reg [data_width-1:0]In[T-1:0];
  reg [data_width-1:0]Out;
	
	wire [data_width-1:0] pxl_out;
	wire valid_out;
	
initial begin
 	clk = 0;
  
  //7x1 
 	kernel_00=32'h3f800000;
 	kernel_03=32'h40000000;
 	kernel_06=32'h3f800000;
 	kernel_09=32'h40000000;
 	kernel_12=32'h3f800000;
 	kernel_15=32'h40000000;
 	kernel_18=32'h3f800000;
 	
 	//7x1
  /*kernel_00=32'd0;
 	kernel_03=32'd0;
 	kernel_06=32'd0;
 	kernel_09=32'h3f800000;
 	kernel_12=32'd0;
 	kernel_15=32'd0;
 	kernel_18=32'd0;*/
 	
  i=0;
	reset = 0;

  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In);
  Out = $fopen("E:/Drive/ICDesign_Seminar/Result/Text/Output_Conv_71_p.txt");
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

	conv_71_p #(D,data_width) uut (
		.clk(clk), 
		.reset(reset), 
		.valid_in(valid_in),
		.pxl_in(pxl_in),
		
		.kernel_00(kernel_00), 
		.kernel_03(kernel_03), 
		.kernel_06(kernel_06), 
		.kernel_09(kernel_09), 
	  .kernel_12(kernel_12), 
		.kernel_15(kernel_15), 
		.kernel_18(kernel_18), 

		.pxl_out(pxl_out),
		.valid_out(valid_out)

	);

endmodule




