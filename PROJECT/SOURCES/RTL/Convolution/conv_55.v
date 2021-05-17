module conv_55(
    	input clk,
    	input reset,
    	input [7:0] pxl_in,
			//debug
	   output [15:0] reg_00 , output [15:0] reg_01 , output [15:0] reg_02 , output [15:0] reg_03 , output [15:0] reg_04 , output[15:0] sr_0, 	
	   output [15:0] reg_220, output [15:0] reg_221, output [15:0] reg_222, output [15:0] reg_223, output [15:0] reg_224, output[15:0] sr_1, 
	   output [15:0] reg_440, output [15:0] reg_441, output [15:0] reg_442, output [15:0] reg_443, output [15:0] reg_444, output[15:0] sr_2,
	   output [15:0] reg_660, output [15:0] reg_661, output [15:0] reg_662, output [15:0] reg_663, output [15:0] reg_664, output[15:0] sr_3, 
	   output [15:0] reg_880, output [15:0] reg_881, output [15:0] reg_882, output [15:0] reg_883, output [15:0] reg_884,
    	output reg [15:0] pxl_out,
	   output valid,
	   output [7:0] test,
	   output [16:0] test_valid
    );
    
	parameter W = 220;	//Width
	parameter H = 220;	//Height
	parameter K = 5; 	//5*5 Kernel

	wire [15:0] cell_00 ; wire [15:0] cell_01 ; wire [15:0] cell_02 ; wire [15:0] cell_03 ; wire [15:0] cell_04;
	wire [15:0] cell_220; wire [15:0] cell_221; wire [15:0] cell_222; wire [15:0] cell_223; wire [15:0] cell_224;
	wire [15:0] cell_440; wire [15:0] cell_441; wire [15:0] cell_442; wire [15:0] cell_443; wire [15:0] cell_444;
  wire [15:0] cell_660; wire [15:0] cell_661; wire [15:0] cell_662; wire [15:0] cell_663; wire [15:0] cell_664;
	wire [15:0] cell_880; wire [15:0] cell_881; wire [15:0] cell_882; wire [15:0] cell_883; wire [15:0] cell_884;
	// 5*5 kernel
	integer kernel_00 = 2;  integer kernel_01 = 2;  integer kernel_02 = 4;  integer kernel_03 = 2;  integer kernel_04 = 2;
	integer kernel_05 = 1;  integer kernel_06 = 1;  integer kernel_07 = 2;  integer kernel_08 = 1;  integer kernel_09 = 1;
	integer kernel_10 = 0;  integer kernel_11 = 0;  integer kernel_12 = 0; 	integer kernel_13 = 0;  integer kernel_14 = 0;
	integer kernel_15 = -1; integer kernel_16 = -1; integer kernel_17 = -2; integer kernel_18 = -1; integer kernel_19 = -1;
	integer kernel_20 = -2; integer kernel_21 = -2; integer kernel_22 = -4;	integer kernel_23 = -2; integer kernel_24 = -2;
 
	
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
	
	shift_55 row_1(clk, reg_04, sr_0);

	//Hang 2

	alu alu_220(pxl_in, kernel_05, sr_0, cell_220); 
	register r_220(clk, reset, cell_220, reg_220); 

	alu alu_221(pxl_in, kernel_06, reg_220, cell_221); 
	register r_221(clk, reset, cell_221, reg_221); 

	alu alu_222(pxl_in, kernel_07, reg_221, cell_222); 
	register r_222(clk, reset, cell_222, reg_222); 

  alu alu_223(pxl_in, kernel_08, reg_222, cell_223); 
	register r_556(clk, reset, cell_223, reg_223); 

	alu alu_224(pxl_in, kernel_09, reg_223, cell_224); 
	register r_224(clk, reset, cell_224, reg_224); 
	
	shift_55 row_2(clk, reg_224, sr_1);

	//Hang 3
	
	alu alu_440(pxl_in, kernel_10, sr_1, cell_440); 
	register r_440(clk, reset, cell_440, reg_440); 

	alu alu_441(pxl_in, kernel_11, reg_440, cell_441); 
	register r_441(clk, reset, cell_441, reg_441); 

	alu alu_442(pxl_in, kernel_12, reg_441, cell_442); 
	register r_442(clk, reset, cell_442, reg_442); 

  alu alu_443(pxl_in, kernel_13, reg_442, cell_443); 
	register r_443(clk, reset, cell_443, reg_443); 

	alu alu_444(pxl_in, kernel_14, reg_443, cell_444); 
	register r_444(clk, reset, cell_444, reg_444); 
	
	shift_55 row_3(clk, reg_444, sr_2);
	
	//Hang 4
	alu alu_660(pxl_in, kernel_15, sr_2, cell_660); 
	register r_660(clk, reset, cell_660, reg_660); 

	alu alu_661(pxl_in, kernel_16, reg_660, cell_661); 
	register r_661(clk, reset, cell_661, reg_661); 

	alu alu_662(pxl_in, kernel_17, reg_661, cell_662); 
	register r_662(clk, reset, cell_662, reg_662); 

  alu alu_663(pxl_in, kernel_18, reg_662, cell_663); 
	register r_663(clk, reset, cell_663, reg_663); 

	alu alu_664(pxl_in, kernel_19, reg_663, cell_664); 
	register r_664(clk, reset, cell_664, reg_664); 
	
	shift_55 row_4(clk, reg_664, sr_3); 
	
	//Hang 5
	alu alu_880(pxl_in, kernel_20, sr_3, cell_880); 
	register r_880(clk, reset, cell_880, reg_880); 

	alu alu_881(pxl_in, kernel_21, reg_880, cell_881); 
	register r_881(clk, reset, cell_881, reg_881); 

	alu alu_882(pxl_in, kernel_22, reg_881, cell_882); 
	register r_882(clk, reset, cell_882, reg_882); 

  alu alu_883(pxl_in, kernel_23, reg_882, cell_883); 
	register r_883(clk, reset, cell_883, reg_883); 

	alu alu_884(pxl_in, kernel_24, reg_883, cell_884); 
	register r_884(clk, reset, cell_884, reg_884); 
	
	reg [15:0] abs;
	
	integer neg1 = -1;
	always @(posedge clk)begin
	if(reg_884[15] == 1'b1)begin
	 abs <= reg_884 * neg1;
	 end
	 else begin
	   abs <= reg_884;
	   end
	   
	  assign pxl_out = abs;
	 end
	   	

	// Valid Ouput

  reg [16:0] counter = 0;
	reg tmp = 0;
	

  assign test_valid = counter;
	always @(posedge clk) begin
		counter = counter + 1;
		if (counter > ((K-1)*H + (K+1)) && counter < (W*H) + K) begin
			if ((counter - (K-2)) % H > 3) begin
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


