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
	
  wire [15:0] reg_00 ;
  wire[15:0] sr_0;
	wire [15:0] reg_220;
	wire[15:0] sr_1;
	wire [15:0] reg_440;
	wire[15:0] sr_2;
	wire [15:0] reg_660 ;
  wire[15:0] sr_3;
	wire [15:0] reg_880;
	wire[15:0] sr_4;
	wire [15:0] reg_1100;
	wire[15:0] sr_5;
	wire [15:0] reg_1320;
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
  if(i == T+2) begin
  $finish;
end
end

	conv_71 uut (
		.clk(clk), 
		.reset(reset), 
		.pxl_in(pxl_in),
		.reg_00(reg_00), 
		.sr_0(sr_0),
		.reg_220(reg_220),
		.sr_1(sr_1),
		.reg_440(reg_440),
		.sr_2(sr_2),
		.reg_660(reg_660),
		.sr_3(sr_3),
		.reg_880(reg_880),
		.sr_4(sr_4),
		.reg_1100(reg_1100),
		.sr_5(sr_5),
		.reg_1320(reg_1320),
		.pxl_out(pxl_out),
		.valid(valid),
		.test(test),
		.test_valid(test_valid)
	);

endmodule
