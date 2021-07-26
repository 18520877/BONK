 module add_layer
#(
  parameter D = 220,
  parameter DATA_WIDTH = 32)
(
    	input clk,
     	input reset,
     	input valid_in_1,valid_in_2,
    	input [DATA_WIDTH-1:0] pxl_in_1,
    	input [DATA_WIDTH-1:0] pxl_in_2,
    	
    	output reg [DATA_WIDTH-1:0] pxl_out,
	   output valid_out
	 );
	reg [DATA_WIDTH-1:0] tmp2,tmp4;
  wire [DATA_WIDTH-1:0] tmp1,tmp3,tmp5;
                   
 	reg [DATA_WIDTH-1:0] memory1[(D*D)-1:0];
	reg valid_memory1;
		reg valid_memory2;
	integer i = 0;
	
	always @(posedge clk)begin
	 if(reset)begin
	   memory1[i] <= 0;
	   valid_memory1 = 1'b0;
	   end
	 else if(valid_in_1 == 1'b1 && i < D*D)begin
	   memory1[i] <= pxl_in_1;
	   i<=i+1;
	   valid_memory1 = 1'b0;
	   end
	else if(i == D*D)begin
	  valid_memory1 = 1'b1;
	  end
	 end

	 
 	reg [DATA_WIDTH-1:0] memory2[(D*D)-1:0];
	integer g = 0;
	integer h = 0;
	
	always @(posedge clk)begin
	 if(reset)begin
	   memory2[g] <= 0;
	   valid_memory2 = 1'b0;
	   end
	 else if(valid_in_2 == 1'b1 && g < D*D)begin
	   memory2[g] <= pxl_in_2;
	   g<=g+1;
	   valid_memory2 = 1'b0;
	   end
	else if(g == D*D)begin
	  valid_memory2 = 1'b1;
	  end
	 end
	  
	 always @(posedge clk)begin
	if(valid_memory1 && valid_memory2)begin
	   tmp4 <= memory2[h];
	   tmp2 <= memory1[h];
	   h <=h+1;
	 end
	   	 end
	   	 
	  assign tmp3 = tmp4;
	 	assign tmp1 = tmp2;
	 	
	 add #(DATA_WIDTH) add_00(tmp1, tmp3, tmp5);

	 reg [DATA_WIDTH-1:0] tmp_out;
	    
	always @(posedge clk)begin
	if(reset)begin
	 pxl_out <= 0;
	 end
	 else begin
	   pxl_out <= tmp5;
	   end
	   
	 end
	 
	 integer counter = 0;
	reg tmp_valid = 0;
  reg en_valid = 0;
  
	 always @(posedge clk)begin
	   if(valid_memory1 && valid_memory2)begin
	    en_valid = 1;
	    end
	  if(en_valid == 1'b1)begin
		  counter <= counter + 1;
		  end
		else begin
		  counter <=0;
		  end
	if(counter > 0 && counter <=  (D * D))begin
	   tmp_valid <= 1;
	 end
	else tmp_valid <= 0; 
	 end 
	 	  
	 	  assign valid_out = tmp_valid;

endmodule 