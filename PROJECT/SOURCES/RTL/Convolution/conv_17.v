module conv_17(
    	input clk,
    	input reset,
    	input [7:0] pxl_in,
			//debug
    	output [15:0] reg_00, 
    	output [15:0] reg_01, 
    	output [15:0] reg_02, 
    	output [15:0] reg_03, 
    	output [15:0] reg_04, 
    	output [15:0] reg_05, 
    	output [15:0] reg_06,
    	 
    	output reg [7:0] pxl_out,
	   output valid,
	   output [7:0] test,
	   output [15:0] test_valid
    );
    
	parameter W = 220;	//Width
	parameter H = 220;	//Height
	parameter K = 1; 	//1*7 Kernel

	wire [15:0] cell_00 ; 
	wire [15:0] cell_01 ; 
	wire [15:0] cell_02; 
	wire [15:0] cell_03; 
	wire [15:0] cell_04; 
	wire [15:0] cell_05; 
	wire [15:0] cell_06; 

	// 1*7 kernel
	integer kernel_00 = -1;
	integer kernel_01 = 0;
	integer kernel_02 = 1;
	integer kernel_03 = 0; 
	integer kernel_04 = -1; 
	integer kernel_05 = 0;
	integer kernel_06 = 1; 
	
	//Hang 1
	assign test = pxl_in;
	alu alu_00(pxl_in, kernel_00, 16'b0, cell_00);
	register r_00(clk, reset, cell_00, reg_00); 

	alu alu_01(pxl_in, kernel_01, reg_00, cell_01); 
	register r_01(clk, reset, cell_01, reg_01); 

	alu alu_02(pxl_in, kernel_02, reg_01, cell_02); 
	register r_02(clk, reset, cell_02, reg_02); 

  alu alu_03(pxl_in, kernel_03, reg_02, cell_03); 
	register r_03(clk, reset, cell_03, reg_03); 
  
  alu alu_04(pxl_in, kernel_04, reg_03, cell_04); 
	register r_04(clk, reset, cell_04, reg_04); 

  alu alu_05(pxl_in, kernel_05, reg_04, cell_05); 
	register r_05(clk, reset, cell_05, reg_05); 

  alu alu_06(pxl_in, kernel_06, reg_05, cell_06); 
	register r_06(clk, reset, cell_06, reg_06); 
	
	//Abs
	reg [15:0] abs;
	
	integer neg1 = -1;
	always @(posedge clk)begin
	if(reg_06[15] == 1'b1)begin
	 abs <= reg_06 * neg1;
	 end
	 else begin
	   abs <= reg_06;
	   end
	   
	  assign pxl_out = abs[7:0];
	 end
	   	

	// Valid Ouput

  reg [16:0] counter = 0;
	reg tmp = 0;
	
  assign test_valid = counter;
	always @(posedge clk) begin
		counter = counter + 1;
		if (counter > ((K-1)*H + K+6) && counter < (W*H) + K+2) begin
			if ((counter - (K+2)) % H > 5) begin
				tmp <= 1;
				end
			else
				tmp <= 0;
				end
		else
			tmp <= 0; 
			end
				 
	assign valid = tmp;
endmodule

