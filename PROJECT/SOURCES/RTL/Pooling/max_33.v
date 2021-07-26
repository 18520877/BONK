// Max Pooling 3x3, Stride = 2, Padding = 0.

module max_33
#(parameter D = 220,
  parameter DATA_WIDTH = 8)
(
      //input
    	input clk,
 	 	 input reset,valid_in,
    	input [DATA_WIDTH-1:0] pxl_in,
			//output
    	
	   output [DATA_WIDTH-1:0] pxl_out,
	   output  valid_out

    );
    
	parameter W = D;	//Weight
	parameter H = D;	//Height
	parameter K = 3;

	 reg [DATA_WIDTH-1:0] tmp7;
	 wire [DATA_WIDTH-1:0] tmp8;
  
	wire [DATA_WIDTH-1:0]  cell_00 , cell_01, cell_02,
	                           cell_220, cell_221, cell_222,
	                           cell_440, cell_441, cell_442;
	                           
  wire [DATA_WIDTH-1:0]  reg_00 , reg_01 , reg_02 , sr_0,  
	                           reg_220, reg_221, reg_222, sr_1, 
	                           reg_440, reg_441, reg_442;
	                                                     
	integer tmp1 = 0;
	
	reg [DATA_WIDTH-1:0] trash;
	
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
	   tmp7 <= memory[j];
	   j <=j+1;
	 end
	   	 end
	  assign tmp8 = tmp7;
	 
	//Hang 1
	alu_max #(DATA_WIDTH) alu_00(tmp8, 32'd0, cell_00);
	register #(DATA_WIDTH) r_00(clk, reset, cell_00, reg_00); 

	alu_max #(DATA_WIDTH) alu_01(tmp8, reg_00, cell_01); 
	register #(DATA_WIDTH) r_01(clk, reset, cell_01, reg_01); 

	alu_max #(DATA_WIDTH) alu_02(tmp8, reg_01, cell_02); 
	register #(DATA_WIDTH) r_02(clk, reset, cell_02, reg_02); 

	shift_33 #(W) row_1(clk, reg_02, sr_0);

	//Hang 2
	alu_max #(DATA_WIDTH) alu_220(tmp8, sr_0, cell_220); 
	register #(DATA_WIDTH) r_10(clk, reset, cell_220, reg_220); 

	alu_max #(DATA_WIDTH) alu_221(tmp8, reg_220, cell_221); 
	register #(DATA_WIDTH) r_11(clk, reset, cell_221, reg_221); 

	alu_max #(DATA_WIDTH) alu_222(tmp8, reg_221, cell_222); 
	register #(DATA_WIDTH) r_12(clk, reset, cell_222, reg_222); 

	shift_33 #(W) row_2(clk, reg_222, sr_1);

	//Hang 3

	alu_max #(DATA_WIDTH) alu_440(tmp8, sr_1, cell_440); 
	register #(DATA_WIDTH) r_20(clk, reset, cell_440, reg_440); 

	alu_max #(DATA_WIDTH) alu_441(tmp8, reg_440, cell_441); 
	register #(DATA_WIDTH) r_21(clk, reset, cell_441, reg_441); 

	alu_max #(DATA_WIDTH) alu_442(tmp8, reg_441, cell_442); 
	register #(DATA_WIDTH) r_22(clk, reset, cell_442, reg_442);

	reg [DATA_WIDTH-1:0] abs;
  
always @(posedge clk) begin
if(valid_memory)begin
	if (tmp1 == 0) begin
		if(reset) begin
	 	abs <= 0;
	 	end
	 	else begin
	   	abs <= reg_442;
	   	end
	end 
	else if (tmp1 != 0) begin
		if ((tmp1)%2 == 0) begin
			if(reset) begin
	 			abs <= 0;
	 		end
	 		else begin
	   		abs <= reg_442;
	   		end
		end
		else if ((tmp1)%2 != 0) begin	
			trash <= reg_442;
		end
	end
	tmp1 = tmp1 + 1;
	end
	end
	
	wire [DATA_WIDTH-1:0] tmp_out_1;
	wire [DATA_WIDTH-1:0] tmp_out_2;	
	  
	assign tmp_out_1 = abs;
	
	
	register #(DATA_WIDTH) reg_tmp1(clk, reset, tmp_out_1, tmp_out_2);
	register #(DATA_WIDTH) reg_tmp2(clk, reset, tmp_out_2, pxl_out);

	// Valid Ouput
  wire out_valid,row_valid;
  
	reg en_valid;
	
  integer counter = 0;
  
	reg tmp = 0;
	

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
		if (counter > ((K-1)*H + (K+2)) && counter < (W*H) + (K+3)) begin
		  	if (counter  % 2 == 0) begin
				tmp <= 1;
				end
			else
				tmp <= 0;
				end
		else
			tmp <= 0; 
			end
			
	assign out_valid = tmp;
	
integer tmp3 = 0; //bien dem tung gia tri
integer tmp4 = 0; //bien dem dong
reg tmp5 = 0;
integer tmp6 = (W/2) + 1; 

always @(posedge out_valid) begin  
  if (counter > ((K-1)*H + (K+2)) && counter < (W*H) + (K+3)) begin
    if (out_valid == 1) begin 
	     tmp3 = tmp3 + 1;
    end
    
    if (tmp3 % tmp6 == 0) begin
	   	tmp4 = tmp4 + 1;
    end
    else if (tmp3 % tmp6 != 0) begin
      tmp4 = tmp4;
    end
end

if (counter > ((K-1)*H + (K+2)) && counter < (W*H) + (K+3)) begin
	if ((tmp4 + (K-1)) % 2 == 0) begin
		tmp5 = 1;
	end
	else  
		tmp5 = 0;
	end	
else  begin
	tmp5 = 0;
end

if(tmp3 % tmp6 == 0 && tmp3 >= (W/2))begin
  if(row_valid == 0)begin
    tmp6 <= tmp6 + (W/2);  
  end
  else begin
    tmp6 <= tmp6 + (W/2) + 1;  
  end
end

end

assign row_valid = tmp5;

assign valid_out = row_valid & out_valid;

endmodule







