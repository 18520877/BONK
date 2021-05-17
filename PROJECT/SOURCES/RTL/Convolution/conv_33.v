module conv_33(
    	input clk,
    	input reset,
    	input [7:0] pxl_in,
			//debug
	output [15:0] reg_00, output [15:0] reg_01, output [15:0] reg_02, output[15:0] sr_0, 	
	output [15:0] reg_220, output [15:0] reg_221, output [15:0] reg_222, output[15:0] sr_1, 
	output [15:0] reg_440, output [15:0] reg_441, output [15:0] reg_442, 
	
    	output reg [7:0] pxl_out,
	   output valid,
	   output [7:0] test,
	   output [15:0] test_valid
    );
    
	parameter W = 220;	//Width
	parameter H = 220;	//Height
	parameter K = 3; 	//3*3 Kernel

	wire [15:0] cell_00 ; wire [15:0] cell_01 ; wire [15:0] cell_02;
	wire [15:0] cell_220; wire [15:0] cell_221; wire [15:0] cell_222;
	wire [15:0] cell_440; wire [15:0] cell_441; wire [15:0] cell_442;

	// 3*3 kernel
	integer kernel_00 = -1; integer kernel_01 = 0; integer kernel_02 = 1;
	integer kernel_03 = -2; integer kernel_04 = 0; integer kernel_05 = 2;
	integer kernel_06 = -1; integer kernel_07 = 0; integer kernel_08 = 1;	
	
	//Hang 1
	assign test = pxl_in;
	alu alu_00(pxl_in, kernel_00, 16'b0, cell_00);
	register r_00(clk, reset, cell_00, reg_00); 

	alu alu_01(pxl_in, kernel_01, reg_00, cell_01); 
	register r_01(clk, reset, cell_01, reg_01); 

	alu alu_02(pxl_in, kernel_02, reg_01, cell_02); 
	register r_02(clk, reset, cell_02, reg_02); 

	shift_33 row_1(clk, reg_02, sr_0);

	//Hang 2
	alu alu_220(pxl_in, kernel_03, sr_0, cell_220); 
	register r_10(clk, reset, cell_220, reg_220); 

	alu alu_221(pxl_in, kernel_04, reg_220, cell_221); 
	register r_11(clk, reset, cell_221, reg_221); 

	alu alu_222(pxl_in, kernel_05, reg_221, cell_222); 
	register r_12(clk, reset, cell_222, reg_222); 

	shift_33 row_2(clk, reg_222, sr_1);

	//Hang 3

	alu alu_440(pxl_in, kernel_06, sr_1, cell_440); 
	register r_20(clk, reset, cell_440, reg_440); 

	alu alu_441(pxl_in, kernel_07, reg_440, cell_441); 
	register r_21(clk, reset, cell_441, reg_441); 

	alu alu_442(pxl_in, kernel_08, reg_441, cell_442); 
	register r_22(clk, reset, cell_442, reg_442); 
	 
	   	reg [15:0] abs;
	
	integer neg1 = -1;
	always @(posedge clk)begin
	if(reg_442[15] == 1'b1)begin
	 abs <= reg_442 * neg1;
	 end
	 else begin
	   abs <= reg_442;
	   end
	   
	  assign pxl_out = abs[7:0];
	 end

	// Valid Ouput

  reg [16:0] counter = 0;
	reg tmp = 0;
	

  assign test_valid = counter;
	always @(posedge clk) begin
		counter = counter + 1;
		if (counter > ((K-1)*H + K) && counter < (W*H) + K) begin
			if ((counter - K) % H > 1) begin
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
