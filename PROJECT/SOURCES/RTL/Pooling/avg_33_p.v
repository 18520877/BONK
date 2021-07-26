// Average Pooling 3x3, Stride = 1, Padding = 1.

module avg_33_p
#(parameter D = 35,
  parameter DATA_WIDTH = 32)
(
     //input
    	input clk,
    	input reset,
    	input valid_in,
    	input [DATA_WIDTH-1:0] pxl_in,

	   //output
    	output [DATA_WIDTH-1:0] pxl_out,
	   output valid_out
    );
    
	parameter W = D+2;	//Width
	parameter H = D+2;	//Height
	parameter K = 3; 	//3*3 Kernel

	wire [DATA_WIDTH-1:0]  cell_00 , cell_01 , cell_02,
	                           cell_220, cell_221, cell_222,
	                           cell_440, cell_441, cell_442;
	                           
	wire [DATA_WIDTH-1:0] tmp1;
  reg [DATA_WIDTH-1:0] tmp2;
  wire [DATA_WIDTH-1:0] tmp3;
   
  wire valid_padding;  
                        
	wire [DATA_WIDTH-1:0]  reg_00 , reg_01 , reg_02 , sr_0,  
	                           reg_220, reg_221, reg_222, sr_1, 
	                           reg_440, reg_441, reg_442,out_div; 

	// 3*3 kernel 
	/*wire [DATA_WIDTH-1:0] kernel_00 = 32'd0; wire [DATA_WIDTH-1:0] kernel_01 = 32'd0                               ; wire [DATA_WIDTH-1:0] kernel_02 = 32'd0;
	wire [DATA_WIDTH-1:0] kernel_03 = 32'd0; wire [DATA_WIDTH-1:0] kernel_04 = 32'b00111111100000000000000000000000; wire [DATA_WIDTH-1:0] kernel_05 = 32'd0;
	wire [DATA_WIDTH-1:0] kernel_06 = 32'd0; wire [DATA_WIDTH-1:0] kernel_07 = 32'd0                               ; wire [DATA_WIDTH-1:0] kernel_08 = 32'd0;	
	*/
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
	 padding_33 #(D,DATA_WIDTH) p0(  .clk(clk),
	                                  .reset(reset),
	                                  .en(valid_memory),
	                                  .pxl_in(tmp4),
	                                  .pxl_out(tmp3),
	                                  .valid(valid_padding)
	                                  );
	 
	 	always @(posedge clk)begin
	if(valid_padding == 1'b1)begin
	   tmp2 <= tmp3;
	 end
	 end
	 	  assign tmp1 = tmp2;
	//Hang 1
	add #(DATA_WIDTH) alu_00(tmp1, 32'd0, cell_00);
	register #(DATA_WIDTH) r_00(clk, reset, cell_00, reg_00); 	 
  
	add #(DATA_WIDTH) alu_01(tmp1, reg_00, cell_01); 
	register #(DATA_WIDTH) r_01(clk, reset, cell_01, reg_01); 

	add #(DATA_WIDTH) alu_02(tmp1, reg_01, cell_02); 
	register #(DATA_WIDTH) r_02(clk, reset, cell_02, reg_02); 

	shift_33 #(W) row_1(clk, reg_02, sr_0);

	//Hang 2
	add #(DATA_WIDTH) alu_220(tmp1, sr_0, cell_220); 
	register #(DATA_WIDTH) r_10(clk, reset, cell_220, reg_220); 

	add #(DATA_WIDTH) alu_221(tmp1, reg_220, cell_221); 
	register #(DATA_WIDTH) r_11(clk, reset, cell_221, reg_221); 

	add #(DATA_WIDTH) alu_222(tmp1, reg_221, cell_222); 
	register #(DATA_WIDTH) r_12(clk, reset, cell_222, reg_222); 

	shift_33 #(W) row_2(clk, reg_222, sr_1);

	//Hang 3

	add #(DATA_WIDTH) alu_440(tmp1, sr_1, cell_440); 
	register #(DATA_WIDTH) r_20(clk, reset, cell_440, reg_440); 

	add #(DATA_WIDTH) alu_441(tmp1, reg_440, cell_441); 
	register #(DATA_WIDTH) r_21(clk, reset, cell_441, reg_441); 

	add #(DATA_WIDTH) alu_442(tmp1, reg_441, cell_442); 
	register #(DATA_WIDTH) r_22(clk, reset, cell_442, reg_442); 
	
		div #(DATA_WIDTH,32'b01000001000100000000000000000000) div0( 
	                           .in(reg_442), 
	                           .out(out_div)
	                           );
  reg [DATA_WIDTH-1:0] abs;
	
	always @(posedge clk)begin
	if(reset)begin
	 abs <= 0;
	 end
	 else begin
	   abs <= out_div;
	   end
	 end
	 
	  assign pxl_out = abs;
	  
	// Valid Ouput

  integer counter = 0;
	reg tmp = 0;
  reg en_valid = 0;
  
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
		if (counter > ((K-1)*H + (K*2) - 1) && counter < (W*H) + (K*2) - 1) begin
			if ((counter - (K+1)) % H > 1) begin
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








