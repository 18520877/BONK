// Convolution Kernel 1x1, Stride = 1, Padding = 0.

module conv_11
#(parameter D = 220,
  parameter DATA_WIDTH = 8)
(
    //input
    	input clk,
    	input reset,valid_in,
    	input [DATA_WIDTH-1:0] pxl_in,
    	//kernel 1x1
    	 input [DATA_WIDTH-1:0] kernel_00,
    //output
    	output [DATA_WIDTH-1:0] pxl_out,
	   output valid_out

    );
    
	parameter W = D;	//Width
	parameter H = D;	//Height
	parameter K = 1; 	//1*1 Kernel
	
  wire [DATA_WIDTH-1:0] tmp1;
  reg [DATA_WIDTH-1:0] tmp2;
     
	wire [DATA_WIDTH-1:0] cell_00;

	
	reg [DATA_WIDTH-1:0] memory [(D*D)-1:0];
	reg valid_memory;
	integer i = 0;
	integer j = 0;
	
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
	   tmp2 <= memory[j];
	   j <=j+1;
	 end
	   	 end
	  assign tmp1 = tmp2;
	 
	//Hang 1
	alu #(DATA_WIDTH) alu_00(tmp1, kernel_00, 32'd0, cell_00);
	
	reg [DATA_WIDTH-1:0] abs;
	
always @(posedge clk)begin
	if(reset)begin
	 abs <= 0;
	 end
	 else begin
	   abs <= cell_00;
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
		if (counter > K - 1  && counter < (W*H) + K) begin
				tmp <= 1;
				end
		else
			tmp <= 0; 
			end
				 
	assign valid_out = tmp;

endmodule



