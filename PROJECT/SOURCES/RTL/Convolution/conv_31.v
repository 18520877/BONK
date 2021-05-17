module conv_31(
    	input clk,
    	input reset,
    	input [7:0] pxl_in,
			//debug
    	output [15:0] reg_00,
    	output[15:0] sr_0, 	
    	output [15:0] reg_220,
    	output[15:0] sr_1, 
    	output [15:0] reg_440,
    	
    	output reg [7:0] pxl_out,
	   output valid,
	   output [7:0] test,
	   output [15:0] test_valid
    );
    
	parameter W = 220;	//Width
	parameter H = 220;	//Height
	parameter K = 3; 	//3*1 Kernel

	wire [15:0] cell_00 ; 
	wire [15:0] cell_220; 
	wire [15:0] cell_440;

	// 3*1 kernel
	integer kernel_00 = 1; 
	integer kernel_03 = 0; 
	integer kernel_06 = -1;
	
	//Hang 1
	assign test = pxl_in;
	alu alu_00(pxl_in, kernel_00, 16'b0, cell_00);
	register r_00(clk, reset, cell_00, reg_00); 
	
	shift row_1(clk, reg_00, sr_0);

	//Hang 2
	alu alu_220(pxl_in, kernel_03, sr_0, cell_220); 
	register r_10(clk, reset, cell_220, reg_220); 

	shift row_2(clk, reg_220, sr_1);

	//Hang 3
	alu alu_440(pxl_in, kernel_06, sr_1, cell_440); 
	register r_20(clk, reset, cell_440, reg_440); 

	//Abs
	reg [15:0] abs;
	
	integer neg1 = -1;
	always @(posedge clk)begin
	if(reg_440[15] == 1'b1)begin
	 abs <= reg_440 * neg1;
	 end
	 else begin
	   abs <= reg_440;
	   end
	   
	  assign pxl_out = abs[7:0];
	 end
	   	

	// Valid Ouput

  reg [16:0] counter = 0;
	reg tmp = 0;
	

  assign test_valid = counter;
	always @(posedge clk) begin
		counter = counter + 1;
		if (counter > ((K-1)*H + (K-1)) && counter < (W*H) + K) begin
				tmp <= 1;
				end
		else
			tmp <= 0; 
			end
				 
	assign valid = tmp;

endmodule


