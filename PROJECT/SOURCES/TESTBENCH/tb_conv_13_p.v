`timescale 1ns / 1ps
// Convolution Kernel 1x3, Stride = 1, Padding = 1 Custom.

module tb_conv_13_p;
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

	reg [data_width-1:0]In[T-1:0];
  reg [data_width-1:0]Out;
	
	wire [data_width-1:0] pxl_out;
	wire valid_out;
	
initial begin
 	clk = 0;

 	kernel_00=32'd0;
 	kernel_01=32'h3f800000;
 	kernel_02=32'd0;

  i=0;
	reset = 0;

  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In);
  Out = $fopen("E:/Drive/ICDesign_Seminar/Result/Text/Output_Conv_13_p.txt");
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

	conv_13_p #(D,data_width) uut (
		.clk(clk), 
		.reset(reset), 
		.valid_in(valid_in),
		.pxl_in(pxl_in),
		
		.kernel_00(kernel_00), 
		.kernel_01(kernel_01), 
		.kernel_02(kernel_02),

		.pxl_out(pxl_out),
		.valid_out(valid_out)

	);

endmodule




