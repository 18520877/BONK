`timescale 1ns / 1ps
// Convolution Kernel 5x5, Stride = 1, Padding = 2.

module tb_conv_55_p;
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

	reg [data_width-1:0] kernel_00, kernel_01, kernel_02, kernel_03, kernel_04; 
	reg [data_width-1:0] kernel_05, kernel_06, kernel_07, kernel_08, kernel_09;
	reg [data_width-1:0] kernel_10, kernel_11, kernel_12, kernel_13, kernel_14; 
	reg [data_width-1:0] kernel_15, kernel_16, kernel_17, kernel_18, kernel_19;	
	reg [data_width-1:0] kernel_20, kernel_21, kernel_22, kernel_23, kernel_24;
	
	reg [data_width-1:0]In[T-1:0];
  reg [data_width-1:0]Out;
	
	wire [data_width-1:0] pxl_out;
	wire valid_out;
	
initial begin
 	clk = 0;
 	
 	//5x5
 	kernel_00=32'h40000000;
 	kernel_01=32'h40000000;
 	kernel_02=32'h40800000;
 	kernel_03=32'h40000000;
 	kernel_04=32'h40000000;
 	
 	kernel_05=32'h3f800000;
 	kernel_06=32'h3f800000;
 	kernel_07=32'h40000000;
 	kernel_08=32'h3f800000;
 	kernel_09=32'h3f800000;
 	
 	kernel_10=32'd0;
 	kernel_11=32'd0;
 	kernel_12=32'd0;
 	kernel_13=32'd0;
 	kernel_14=32'd0;
 	
 	kernel_15=32'hbf800000;
 	kernel_16=32'hbf800000;
 	kernel_17=32'hc0000000;
 	kernel_18=32'hbf800000;
 	kernel_19=32'hbf800000;
 	
 	kernel_20=32'hc0000000;
 	kernel_21=32'hc0000000;
 	kernel_22=32'hc0800000;
 	kernel_23=32'hc0000000;
 	kernel_24=32'hc0000000;
 	
 	//5x5test
 	/*kernel_00=32'd0;
 	kernel_01=32'd0;
 	kernel_02=32'd0;
 	kernel_03=32'd0;
 	kernel_04=32'd0;
 	
 	kernel_05=32'd0;
 	kernel_06=32'd0;
 	kernel_07=32'd0;
 	kernel_08=32'd0;
 	kernel_09=32'd0;
 	
 	kernel_10=32'd0;
 	kernel_11=32'd0;
 	kernel_12=32'h3f800000;
 	kernel_13=32'd0;
 	kernel_14=32'd0;
 	
 	kernel_15=32'd0;
 	kernel_16=32'd0;
 	kernel_17=32'd0;
 	kernel_18=32'd0;
 	kernel_19=32'd0;
 	
 	kernel_20=32'd0;
 	kernel_21=32'd0;
 	kernel_22=32'd0;
 	kernel_23=32'd0;
 	kernel_24=32'd0;*/
 	
  i=0;
	reset = 0;

  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In);
  Out = $fopen("E:/Drive/ICDesign_Seminar/Result/Text/Output_Conv_55_p.txt");
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

	conv_55_p #(D,data_width) uut (
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
		.kernel_09(kernel_09), 
		              .kernel_10(kernel_10), 
	               	.kernel_11(kernel_11),
	               	.kernel_12(kernel_12), 
	               	.kernel_13(kernel_13), 
	               	.kernel_14(kernel_14),
		              .kernel_15(kernel_15), 
		              .kernel_16(kernel_16), 
		              .kernel_17(kernel_17),
		              .kernel_18(kernel_18), 
		              .kernel_19(kernel_19), 
	               	.kernel_20(kernel_20),
	               	.kernel_21(kernel_21), 
	               	.kernel_22(kernel_22), 
	               	.kernel_23(kernel_23),
		              .kernel_24(kernel_24), 

		.pxl_out(pxl_out),
		.valid_out(valid_out)

	);

endmodule




