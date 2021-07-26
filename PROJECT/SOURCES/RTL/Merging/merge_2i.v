 module merge_2i
#(
  parameter D = 220,
  parameter C_1 = 1,
  parameter C_2 = 1,
  parameter DATA_WIDTH = 32
)
(
    	input clk,
     	input reset,
     	input valid_in_1,valid_in_2,
    	input [DATA_WIDTH-1:0] pxl_in_1,
    	input [DATA_WIDTH-1:0] pxl_in_2,
    	
    	output [DATA_WIDTH-1:0] pxl_out,
	   output valid_out
	 );
   parameter T_1 = D * D * C_1;
	 parameter T_2 = D * D * C_2;
	 
	 reg [DATA_WIDTH-1:0]memory_1[T_1:0];
	 reg [DATA_WIDTH-1:0]memory_2[T_2:0];
	 
	 integer i = 0;
   integer j = 0;
   
   integer g = 0;
   integer h = 0;
   
   reg [DATA_WIDTH-1:0] tmp;
   reg tmp_valid = 0;
   
	 always @(posedge clk, posedge reset) begin
	   if(reset)begin
	     tmp = 0;
	     end
	   end 
	   
	   always @(posedge clk) begin
	   if(valid_in_1)begin
	     memory_1[i] = pxl_in_1;
	     i <= i + 1;
	     end
	   if(valid_in_2)begin
	     memory_2[j] = pxl_in_2;
	     j <= j + 1;
	     end  
	   end 
	   
	   always @(posedge clk) begin
	   if(j >= T_2 && g < T_1 + 1)begin
	     tmp <= memory_1[g];
	     tmp_valid <= 1;
	     g <= g+1;
	     end 
	    if(g >= T_1 && h < T_2)begin
	      tmp <= memory_2[h];
	      tmp_valid <= 1;
	       h <= h+1;
	      end
	    else if(h == T_2) tmp_valid = 0;
	   end
	   
	   assign pxl_out = tmp;
	   assign valid_out = tmp_valid;

	   endmodule 