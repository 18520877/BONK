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
  reg [15:0]Out;
	
	wire [15:0] pxl_out;
	wire valid;
	
  wire [15:0] reg_00 ; wire [15:0] reg_01 ; wire [15:0] reg_02 ; wire [15:0] reg_03 ; wire [15:0] reg_04 ; wire[15:0] sr_0;
	wire [15:0] reg_220; wire [15:0] reg_221; wire [15:0] reg_222; wire [15:0] reg_223; wire [15:0] reg_224; wire[15:0] sr_1;
	wire [15:0] reg_440; wire [15:0] reg_441; wire [15:0] reg_442; wire [15:0] reg_443; wire [15:0] reg_444; wire[15:0] sr_2;
	wire [15:0] reg_660; wire [15:0] reg_661; wire [15:0] reg_662; wire [15:0] reg_663; wire [15:0] reg_664; wire[15:0] sr_3;
	wire [15:0] reg_880; wire [15:0] reg_881; wire [15:0] reg_882; wire [15:0] reg_883; wire [15:0] reg_884; 
	wire [7:0] test;
	wire [15:0] test_valid;
initial begin
  i=0;
	clk = 0;
	reset = 0;
  $readmemb("input.txt", In);
  Out = $fopen("output_gx_55.txt");
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

	conv_55 uut (
		.clk(clk), 
		.reset(reset), 
		.pxl_in(pxl_in),
		.reg_00(reg_00), 
		.reg_01(reg_01),
		.reg_02(reg_02),
		.reg_03(reg_03),
		.reg_04(reg_04),
		.sr_0(sr_0),
		.reg_220(reg_220),
		.reg_221(reg_221),
		.reg_222(reg_222),
		.reg_223(reg_223),
		.reg_224(reg_224),
		.sr_1(sr_1),
		.reg_440(reg_440),
		.reg_441(reg_441),
		.reg_442(reg_442),
		.reg_443(reg_443),
		.reg_444(reg_444),
		.sr_2(sr_2),
		.reg_660(reg_660),
		.reg_661(reg_661),
		.reg_662(reg_662),
		.reg_663(reg_663),
		.reg_664(reg_664),
		.sr_3(sr_3),
		.reg_880(reg_880),
		.reg_881(reg_881),
		.reg_882(reg_882),
		.reg_883(reg_883),
		.reg_884(reg_884),
		.pxl_out(pxl_out),
		.valid(valid),
		.test(test),
		.test_valid(test_valid)
	);

endmodule
