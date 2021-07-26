// Convolution Kernel 7x1, Stride = 1, Padding = 3 Custom.

module conv_71_p
#(parameter D = 220,
  parameter DATA_WIDTH = 32)
(
      //input
    	input clk,
    	input reset,valid_in,
    			input [DATA_WIDTH-1:0] pxl_in,
    			//kernel 7x1
    	 input [DATA_WIDTH-1:0] kernel_00,
	   	input [DATA_WIDTH-1:0] kernel_03,
	    input [DATA_WIDTH-1:0] kernel_06,
	    input [DATA_WIDTH-1:0] kernel_09,
	   	input [DATA_WIDTH-1:0] kernel_12,
	    input [DATA_WIDTH-1:0] kernel_15,
	    input [DATA_WIDTH-1:0] kernel_18,
			//output	 	
    	output [DATA_WIDTH-1:0] pxl_out,
	   output valid_out
    );
    
	parameter W = D;	//Width
	parameter H = D+6;	//Height
	parameter K = 7; 	//7*1 Kernel
	
  wire [DATA_WIDTH-1:0] tmp1;
  reg [DATA_WIDTH-1:0] tmp2;
  wire [DATA_WIDTH-1:0] tmp3;
  
  wire [DATA_WIDTH-1:0]   cell_00, 
                              cell_220, 
                              cell_440,
                              cell_660,
                              cell_880,
                              cell_1100,
                              cell_1320;
                              
  wire [DATA_WIDTH-1:0]   reg_00, sr_0,
                              reg_220, sr_1,
                              reg_440, sr_2,                            
                              reg_660, sr_3, 	
                              reg_880, sr_4, 
                              reg_1100,sr_5, 
                              reg_1320;
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
	
	wire padding_valid;
	
	padding_71 #(D,DATA_WIDTH) p0 (clk,reset,valid_memory,tmp4,tmp3,padding_valid);
	
always @(posedge clk)begin
	if(padding_valid == 1'b1)begin
	   tmp2 <= tmp3;
	 end
end
	 
		  assign tmp1 = tmp2;
  
	//Hang 1
	alu #(DATA_WIDTH) alu_00(tmp1, kernel_00, 32'd0, cell_00);
	register #(DATA_WIDTH) r_00(clk, reset, cell_00, reg_00); 
	
	shift_33 #(D+2) row_1(clk, reg_00, sr_0);

	//Hang 2
	alu #(DATA_WIDTH) alu_220(tmp1, kernel_03, sr_0, cell_220); 
	register #(DATA_WIDTH) r_220(clk, reset, cell_220, reg_220); 

	shift_33 #(D+2) row_2(clk, reg_220, sr_1);

	//Hang 3
	alu #(DATA_WIDTH) alu_440(tmp1, kernel_06, sr_1, cell_440); 
	register #(DATA_WIDTH) r_440(clk, reset, cell_440, reg_440); 

  shift_33 #(D+2) row_3(clk, reg_440, sr_2);
  
  //Hang 4
	alu #(DATA_WIDTH) alu_660(tmp1, kernel_09, sr_2, cell_660); 
	register #(DATA_WIDTH) r_660(clk, reset, cell_660, reg_660); 

  shift_33 #(D+2) row_4(clk, reg_660, sr_3);
  
  //Hang 5
	alu #(DATA_WIDTH) alu_880(tmp1, kernel_12, sr_3, cell_880); 
	register #(DATA_WIDTH) r_880(clk, reset, cell_880, reg_880); 

  shift_33 #(D+2) row_5(clk, reg_880, sr_4);
  
  //Hang 6
	alu #(DATA_WIDTH) alu_1100(tmp1, kernel_15, sr_4, cell_1100); 
	register #(DATA_WIDTH) r_1100(clk, reset, cell_1100, reg_1100); 

  shift_33 #(D+2) row_6(clk, reg_1100, sr_5);
  
  //Hang 7
	alu #(DATA_WIDTH) alu_1320(tmp1, kernel_18, sr_5, cell_1320); 
	register #(DATA_WIDTH) r_1320(clk, reset, cell_1320, reg_1320); 

  
//Abs
  reg [DATA_WIDTH-1:0] abs;
	
	always @(posedge clk)begin
	if(reset)begin
	 abs <= 0;
	 end
	 else begin
	   abs <= reg_1320;
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
		if (counter > ((K-1)*W + (K-4)) && counter < (W*H) + (K-3)) begin
				tmp <= 1;
				end
		else
			tmp <= 0; 
			end
				 
	assign valid_out = tmp;

endmodule





