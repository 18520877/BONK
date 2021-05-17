module conv_13(
    	input clk,
    	input reset,
    	input [7:0] pxl_in,
			//debug
	   output [15:0] reg_00, output [15:0] reg_01, output [15:0] reg_02, 
    	output reg [7:0] pxl_out,
	   output valid,
	   output [7:0] test,
	   output [15:0] test_valid
    );
    
	parameter W = 220;	//Width
	parameter H = 220;	//Height
	parameter K = 1; 	//1*3 Kernel

	wire [15:0] cell_00 ; wire [15:0] cell_01 ; wire [15:0] cell_02;

	// 3*1 kernel
	integer kernel_00 = -1; integer kernel_01 = 0; integer kernel_02 = 1;
	
	//Hang 1
	assign test = pxl_in;
	alu alu_00(pxl_in, kernel_00, 16'b0, cell_00);
	register r_00(clk, reset, cell_00, reg_00); 

	alu alu_01(pxl_in, kernel_01, reg_00, cell_01); 
	register r_01(clk, reset, cell_01, reg_01); 

	alu alu_02(pxl_in, kernel_02, reg_01, cell_02); 
	register r_02(clk, reset, cell_02, reg_02); 
	 
	//Abs
	reg [15:0] abs;
	
	integer neg1 = -1;
	always @(posedge clk)begin
	if(reg_02[15] == 1'b1)begin
	 abs <= reg_02 * neg1;
	 end
	 else begin
	   abs <= reg_02;
	   end
	   
	  assign pxl_out = abs[7:0];
	 end
	   	

	// Valid Ouput

  reg [16:0] counter = 0;
	reg tmp = 0;
	
  assign test_valid = counter;
	always @(posedge clk) begin
		counter = counter + 1;
		if (counter > ((K-1)*H + K+2) && counter < (W*H) + K+2) begin
			if ((counter - (K+2)) % H > 1) begin
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

