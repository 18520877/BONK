`timescale 1ns / 1ps

module testbench;
  parameter T = 48400;
	parameter C = 10;
	parameter I = 20;
	integer i;
	
	reg clk;
	reg reset;
	reg [7:0] pxl_in;
	
	reg [7:0]In[T-1:0];
  reg [7:0]Out;
	
	wire [7:0] pxl_out;
	wire valid;
	
  wire [15:0] reg_00 ;wire [15:0] reg_01 ; wire [15:0] reg_02 ; 
	
	wire [7:0] test;
	wire [15:0] test_valid;
initial begin
  i=0;
	clk = 0;
	reset = 0;
  $readmemb("input.txt", In);
  Out = $fopen("output.txt");
	end 
	always #(C) clk = ~ clk;
	
always @(posedge clk) begin
  pxl_in = In[i];
  #(I) i = i + 1;
  if(valid == 1'b1) begin
      $fdisplay(Out,"%b",pxl_out);
  end
  if(i == T+10) begin
  $finish;
end
end

	conv_13 uut (
		.clk(clk), 
		.reset(reset), 
		.pxl_in(pxl_in),
		.reg_00(reg_00), 
		.reg_01(reg_01),
		.reg_02(reg_02),
		.pxl_out(pxl_out),
		.valid(valid),
		.test(test),
		.test_valid(test_valid)
	);

endmodule
