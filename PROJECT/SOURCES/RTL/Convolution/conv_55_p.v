// Convolution Kernel 5x5, Stride = 1, Padding = 2.

module conv_55_p
#(parameter D = 35,
  parameter DATA_WIDTH = 32)
(
     //input
    	input clk,
    	input reset,
    	input valid_in,
    	input [DATA_WIDTH-1:0] pxl_in,
	   //kernel 5x5	
	input [DATA_WIDTH-1:0] kernel_00, kernel_01, kernel_02, kernel_03, kernel_04, 
	input [DATA_WIDTH-1:0] kernel_05, kernel_06, kernel_07, kernel_08, kernel_09,
	input [DATA_WIDTH-1:0] kernel_10, kernel_11, kernel_12, kernel_13, kernel_14, 
	input [DATA_WIDTH-1:0] kernel_15, kernel_16, kernel_17, kernel_18, kernel_19,	
	input [DATA_WIDTH-1:0] kernel_20, kernel_21, kernel_22, kernel_23, kernel_24,	
	   //output
    	output [DATA_WIDTH-1:0] pxl_out,
	   output valid_out
    );
    
	parameter W = D+4;	//Width
	parameter H = D+4;	//Height
	parameter K = 5; 	//5*5 Kernel

	wire [DATA_WIDTH-1:0]  cell_00  , cell_01  , cell_02  , cell_03  , cell_04  ,
		                         cell_220 , cell_221 , cell_222 , cell_223 , cell_224 , 
	                           cell_440 , cell_441 , cell_442 , cell_443 , cell_444 ,
	                           cell_660 , cell_661 , cell_662 , cell_663 , cell_664 ,                           
	                           cell_880 , cell_881 , cell_882 , cell_883 , cell_884;
	                           
	wire [DATA_WIDTH-1:0] tmp1;
  reg [DATA_WIDTH-1:0] tmp2;
  wire [DATA_WIDTH-1:0] tmp3;
   
  wire valid_padding;  
                        
	wire [DATA_WIDTH-1:0]  reg_00 ,  reg_01 ,  reg_02 ,  reg_03 ,  reg_04 ,  sr_0, 	
	                       reg_220,  reg_221,  reg_222,  reg_223,  reg_224,  sr_1, 
	                       reg_440,  reg_441,  reg_442,  reg_443,  reg_444,  sr_2,
	                       reg_660,  reg_661,  reg_662,  reg_663,  reg_664,  sr_3, 
	                       reg_880,  reg_881,  reg_882,  reg_883,  reg_884; 
  
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
	 padding_55 #(D,DATA_WIDTH) p0(  .clk(clk),
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
	alu #(DATA_WIDTH) alu_00(tmp1, kernel_00, 32'd0, cell_00);
	register #(DATA_WIDTH) r_00(clk, reset, cell_00, reg_00); 

	alu #(DATA_WIDTH) alu_01(tmp1, kernel_01, reg_00, cell_01); 
	register #(DATA_WIDTH) r_01(clk, reset, cell_01, reg_01); 

	alu #(DATA_WIDTH) alu_02(tmp1, kernel_02, reg_01, cell_02); 
	register #(DATA_WIDTH) r_02(clk, reset, cell_02, reg_02); 
	
  alu #(DATA_WIDTH) alu_03(tmp1, kernel_03, reg_02, cell_03); 
	register #(DATA_WIDTH) r_03(clk, reset, cell_03, reg_03); 

	alu #(DATA_WIDTH) alu_04(tmp1, kernel_04, reg_03, cell_04); 
	register #(DATA_WIDTH) r_04(clk, reset, cell_04, reg_04); 
	
	shift_33 #(W-2) row_1(clk, reg_04, sr_0);

	//Hang 2

	alu #(DATA_WIDTH) alu_220(tmp1, kernel_05, sr_0, cell_220); 
	register #(DATA_WIDTH) r_220(clk, reset, cell_220, reg_220); 

	alu #(DATA_WIDTH) alu_221(tmp1, kernel_06, reg_220, cell_221); 
	register #(DATA_WIDTH) r_221(clk, reset, cell_221, reg_221); 

	alu #(DATA_WIDTH) alu_222(tmp1, kernel_07, reg_221, cell_222); 
	register #(DATA_WIDTH) r_222(clk, reset, cell_222, reg_222); 

  alu #(DATA_WIDTH) alu_223(tmp1, kernel_08, reg_222, cell_223); 
	register #(DATA_WIDTH) r_556(clk, reset, cell_223, reg_223); 

	alu #(DATA_WIDTH) alu_224(tmp1, kernel_09, reg_223, cell_224); 
	register #(DATA_WIDTH) r_224(clk, reset, cell_224, reg_224); 
	
	shift_33 #(W-2) row_2(clk, reg_224, sr_1);

	//Hang 3
	
	alu #(DATA_WIDTH) alu_440(tmp1, kernel_10, sr_1, cell_440); 
	register #(DATA_WIDTH) r_440(clk, reset, cell_440, reg_440); 

	alu #(DATA_WIDTH) alu_441(tmp1, kernel_11, reg_440, cell_441); 
	register #(DATA_WIDTH) r_441(clk, reset, cell_441, reg_441); 

	alu #(DATA_WIDTH) alu_442(tmp1, kernel_12, reg_441, cell_442); 
	register #(DATA_WIDTH) r_442(clk, reset, cell_442, reg_442); 

  alu #(DATA_WIDTH) alu_443(tmp1, kernel_13, reg_442, cell_443); 
	register #(DATA_WIDTH) r_443(clk, reset, cell_443, reg_443); 

	alu #(DATA_WIDTH) alu_444(tmp1, kernel_14, reg_443, cell_444); 
	register #(DATA_WIDTH) r_444(clk, reset, cell_444, reg_444); 
	
	shift_33 #(W-2) row_3(clk, reg_444, sr_2);
	
	//Hang 4
	alu #(DATA_WIDTH) alu_660(tmp1, kernel_15, sr_2, cell_660); 
	register #(DATA_WIDTH) r_660(clk, reset, cell_660, reg_660); 

	alu #(DATA_WIDTH) alu_661(tmp1, kernel_16, reg_660, cell_661); 
	register #(DATA_WIDTH) r_661(clk, reset, cell_661, reg_661); 

	alu #(DATA_WIDTH) alu_662(tmp1, kernel_17, reg_661, cell_662); 
	register #(DATA_WIDTH) r_662(clk, reset, cell_662, reg_662); 

  alu #(DATA_WIDTH) alu_663(tmp1, kernel_18, reg_662, cell_663); 
	register #(DATA_WIDTH) r_663(clk, reset, cell_663, reg_663); 

	alu #(DATA_WIDTH) alu_664(tmp1, kernel_19, reg_663, cell_664); 
	register #(DATA_WIDTH) r_664(clk, reset, cell_664, reg_664); 
	
	shift_33 #(W-2) row_4(clk, reg_664, sr_3); 
	
	//Hang 5
	alu #(DATA_WIDTH) alu_880(tmp1, kernel_20, sr_3, cell_880); 
	register #(DATA_WIDTH) r_880(clk, reset, cell_880, reg_880); 

	alu #(DATA_WIDTH) alu_881(tmp1, kernel_21, reg_880, cell_881); 
	register #(DATA_WIDTH) r_881(clk, reset, cell_881, reg_881); 

	alu #(DATA_WIDTH) alu_882(tmp1, kernel_22, reg_881, cell_882); 
	register #(DATA_WIDTH) r_882(clk, reset, cell_882, reg_882); 

  alu #(DATA_WIDTH) alu_883(tmp1, kernel_23, reg_882, cell_883); 
	register #(DATA_WIDTH) r_883(clk, reset, cell_883, reg_883); 

	alu #(DATA_WIDTH) alu_884(tmp1, kernel_24, reg_883, cell_884); 
	register #(DATA_WIDTH) r_884(clk, reset, cell_884, reg_884); 
	
	reg [DATA_WIDTH-1:0] abs;
	
	always @(posedge clk)begin
	if(reset)begin
	 abs <= 0;
	 end
	 else begin
	   abs <= reg_884;
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
		if (counter > ((K-1)*H + (K*2) - 3) && counter < (W*H) + (K*2) - 3) begin
			if ((counter - (K-1)) % H > 3) begin
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