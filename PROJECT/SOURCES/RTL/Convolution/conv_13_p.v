// Convolution Kernel 1x3, Stride = 1, Padding = 1 Custom.

module conv_13_p
#(parameter D = 220,
  parameter DATA_WIDTH = 32)
(
    //input
    	input clk,
    	input reset,valid_in,
    	input [DATA_WIDTH-1:0] pxl_in,
    	//kernel 1x3
  		 input [DATA_WIDTH-1:0] kernel_00,
	   input [DATA_WIDTH-1:0] kernel_01,
	   input [DATA_WIDTH-1:0] kernel_02, 
			//output
    	output [DATA_WIDTH-1:0] pxl_out,
	   output valid_out
    );
    
	parameter W = D + 2;	//Width
	parameter H = D;	//Height
	parameter K = 1; 	//1*3 Kernel
	
  wire [DATA_WIDTH-1:0] tmp1;
  reg [DATA_WIDTH-1:0] tmp2;
  wire [DATA_WIDTH-1:0] tmp3;
  
  wire valid_padding;  
   
	wire [DATA_WIDTH-1:0]  cell_00 , cell_01 , cell_02;
	
	wire [DATA_WIDTH-1:0]  reg_00 , reg_01 , reg_02;

	reg [DATA_WIDTH-1:0] memory [(D*D)-1:0];
	reg valid_memory;
	integer i = 0;
	integer j = 0;
	reg [DATA_WIDTH-1:0] tmp5;
  wire [DATA_WIDTH-1:0] tmp4;
  
	always @(posedge clk)begin
	 if(reset)begin
	   memory[i] <= 0;
	   valid_memory = 1'b0;
	   end
	 else if(valid_in == 1'b1 && i < D*D)begin
	   memory[i] <= pxl_in;
	   i<=i+1;
	   valid_memory = 1'b0;
	   end
	else if(i == D*D)begin
	  valid_memory = 1'b1;
	  end
	 end
	  
	 always @(posedge clk)begin
	if(valid_memory == 1'b1)begin
	   tmp5 <= memory[j];
	   j <=j+1;
	 end
	   	 end
	  assign tmp4 = tmp5;
	
	//Padding
	
	padding_13 #(D,DATA_WIDTH) p0(clk,reset,valid_memory,tmp4,tmp3,valid_padding);
	
		always @(posedge clk)begin
	if(valid_padding == 1'b1)begin
	   tmp2 <= tmp3;
	 end
	end
	
	assign tmp1 = tmp2;
	 
	//Hang 1
	alu #(DATA_WIDTH) alu_00(tmp1, kernel_00, 32'd0, cell_00);
	register #(DATA_WIDTH) r_00(clk, reset, cell_00, reg_00); 

	alu #(DATA_WIDTH) alu_01(tmp1, kernel_01, reg_00, cell_01); 
	register #(DATA_WIDTH) r_01(clk, reset, cell_01, reg_01); 

	alu #(DATA_WIDTH) alu_02(tmp1, kernel_02, reg_01, cell_02); 
	register #(DATA_WIDTH) r_02(clk, reset, cell_02, reg_02); 
	 
	//Abs
	 reg [DATA_WIDTH-1:0] abs;
	
	always @(posedge clk)begin
	if(reset)begin
	 abs <= 0;
	 end
	 else begin
	   abs <= reg_02;
	   end
	 end
	 
	 	  assign pxl_out = abs;  	

	// Valid Ouput

  integer counter = 0;
	reg tmp = 0;
	reg en_valid;
	
	always @(posedge clk) begin
		if(valid_memory)begin
	    en_valid = 1;
	    end
	  if(en_valid == 1'b1)begin
		counter <= counter + 1;
		end
		else begin
		  counter <=0;
		  end
		if (counter > ((K-1)*H + K+4) && counter < (W*H) + K + 4) begin
			if ((counter - (K+3)) % W > 1) begin
				tmp <= 1;
				end
			else
				tmp <= 0;
				end
		else
			tmp <= 0;
			end
			 
	assign valid_out = tmp;
endmodule







