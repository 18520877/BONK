module conv_71(
    	input clk,
    	input reset,
    	input [7:0] pxl_in,
			//debug
    	output [15:0] reg_00,
    	output[15:0] sr_0, 	
    	output [15:0] reg_220,
    	output[15:0] sr_1, 
	   output [15:0] reg_440,
    	output[15:0] sr_2, 
    	output [15:0] reg_660,
    	output[15:0] sr_3, 	
    	output [15:0] reg_880,
	   output[15:0] sr_4, 
    	output [15:0] reg_1100,
    	output[15:0] sr_5, 
    	output [15:0] reg_1320,
    	output reg [7:0] pxl_out,
	   output valid,
	   output [7:0] test,
	   output [15:0] test_valid
    );
    
	parameter W = 220;	//Width
	parameter H = 220;	//Height
	parameter K = 7; 	//7*1 Kernel

	wire [15:0] cell_00 ; 
	wire [15:0] cell_220;
	wire [15:0] cell_440; 
  wire [15:0] cell_660; 
	wire [15:0] cell_880;
	wire [15:0] cell_1100; 
	wire [15:0] cell_1320; 
	// 7*1 kernel
	integer kernel_00 = 1;
	integer kernel_03 = 0; 
	integer kernel_06 = -1;
	integer kernel_09 = 0;
	integer kernel_12 = 1; 
	integer kernel_15 = 0;
	integer kernel_18 = -1;
	
  
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
	register r_440(clk, reset, cell_440, reg_440); 

  shift row_3(clk, reg_440, sr_2);
  
  //Hang 4
	alu alu_660(pxl_in, kernel_09, sr_2, cell_660); 
	register r_20(clk, reset, cell_660, reg_660); 

  shift row_4(clk, reg_660, sr_3);
  
  //Hang 5
	alu alu_880(pxl_in, kernel_12, sr_3, cell_880); 
	register r_880(clk, reset, cell_880, reg_880); 

  shift row_5(clk, reg_880, sr_4);
  
  //Hang 6
	alu alu_1100(pxl_in, kernel_15, sr_4, cell_1100); 
	register r_1100(clk, reset, cell_1100, reg_1100); 

  shift row_6(clk, reg_1100, sr_5);
  
  //Hang 7
	alu alu_1320(pxl_in, kernel_18, sr_5, cell_1320); 
	register r_1320(clk, reset, cell_1320, reg_1320); 

  
	reg [15:0] abs;
	
	integer neg1 = -1;
	always @(posedge clk)begin
	if(reg_1320[15] == 1'b1)begin
	 abs <= reg_1320 * neg1;
	 end
	 else begin
	   abs <= reg_1320;
	   end
	   
	  assign pxl_out = abs[7:0];
	 end
	   	

	// Valid Ouput

  reg [16:0] counter = 0;
	reg tmp = 0;
	

  assign test_valid = counter;
	always @(posedge clk) begin
		counter = counter + 1;
		if (counter > ((K-1)*H + (K-5)) && counter < (W*H) + (K-4)) begin
				tmp <= 1;
				end
		else
			tmp <= 0; 
			end
				 
	assign valid = tmp;

endmodule


