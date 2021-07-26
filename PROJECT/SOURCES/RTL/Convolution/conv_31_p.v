// Convolution Kernel 3x1, Stride = 1, Padding = 1 Custom.

module conv_31_p
#(parameter D = 220,
  parameter DATA_WIDTH = 32)
(
      //input
    	input clk,
    	input reset,valid_in,
		 input [DATA_WIDTH-1:0] pxl_in,
		 //kernel 3x1
    	 input [DATA_WIDTH-1:0] kernel_00,
	   	input [DATA_WIDTH-1:0] kernel_03,
	    input [DATA_WIDTH-1:0] kernel_06,
			//output
   	 output [DATA_WIDTH-1:0] pxl_out,
	   output valid_out
    );
    
	parameter W = D;	//Width
	parameter H = D+2;	//Height
	parameter K = 3; 	//3*1 Kernel
  
  wire [DATA_WIDTH-1:0] tmp1;
  reg [DATA_WIDTH-1:0] tmp2;
  wire [DATA_WIDTH-1:0] tmp3;
  
  wire [DATA_WIDTH-1:0]   cell_00, 
                              cell_220, 
                              cell_440;
                              
  wire [DATA_WIDTH-1:0]   reg_00, sr_0,
                              reg_220, sr_1,
                              reg_440;

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
	
	wire valid_padding;
	padding_31 #(D,DATA_WIDTH) p0 (clk,reset,valid_memory,tmp4,tmp3,valid_padding);
	
	always @(posedge clk)begin
	if(valid_padding == 1'b1)begin
	   tmp2 <= tmp3;
	 end
	end
	 
	 	  assign tmp1 = tmp2;
	 	  
	//Hang 1
	alu #(DATA_WIDTH) alu_00(tmp1, kernel_00, 32'd0, cell_00);
	register #(DATA_WIDTH) r_00(clk, reset, cell_00, reg_00); 
	
	shift_33 #(H) row_1(clk, reg_00, sr_0);

	//Hang 2
	alu #(DATA_WIDTH) alu_220(tmp1, kernel_03, sr_0, cell_220); 
	register #(DATA_WIDTH) r_10(clk, reset, cell_220, reg_220); 

	shift_33 #(H) row_2(clk, reg_220, sr_1);

	//Hang 3
	alu #(DATA_WIDTH) alu_440(tmp1, kernel_06, sr_1, cell_440); 
	register #(DATA_WIDTH) r_20(clk, reset, cell_440, reg_440); 

	//Abs
  reg [DATA_WIDTH-1:0] abs;
	
	always @(posedge clk)begin
	if(reset)begin
	 abs <= 0;
	 end
	 else begin
	   abs <= reg_440;
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
		if (counter > ((K-1)*W + K) && counter < (W*H) + K + 1) begin
				tmp <= 1;
				end
		else
			tmp <= 0; 
			end
				 
	assign valid_out = tmp;

endmodule





