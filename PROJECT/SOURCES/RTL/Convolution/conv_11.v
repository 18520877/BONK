module conv_11(
    	input clk,
    	input reset,
    	input [7:0] pxl_in,
			//debug
	   output [15:0] reg_00,
    	output reg [7:0] pxl_out,
	   output valid,
	   output [7:0] test,
	   output [15:0] test_valid
    );
    
	parameter W = 220;	//Width
	parameter H = 220;	//Height
	parameter K = 1; 	//1*1 Kernel

	wire [15:0] cell_00 ;

	// 1*1 kernel
	integer kernel_00 = -1;
	
	
	//Hang 1
	assign test = pxl_in;
	alu alu_00(pxl_in, kernel_00, 16'b0, cell_00);
	register r_00(clk, reset, cell_00, reg_00); 
	
	reg [15:0] abs;
	
	integer neg1 = -1;
	always @(posedge clk)begin
	if(reg_00[15] == 1'b1)begin
	 abs <= reg_00 * neg1;
	 end
	 else begin
	   abs <= reg_00;
	   end
	   
	  assign pxl_out = abs[7:0];
	 end
	   	

	// Valid Ouput

  reg [16:0] counter = 0;
	reg tmp = 0;
	

  assign test_valid = counter;
	always @(posedge clk) begin
		counter = counter + 1;
		if (counter > ((K-1)*H + (K+1)) && counter < (W*H) + (K+2)) begin
				tmp <= 1;
				end
		else
			tmp <= 0; 
			end
				 
	assign valid = tmp;

endmodule


