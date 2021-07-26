 module merge_4i
#(
  parameter D = 220,
  parameter C_1 = 1,
  parameter C_2 = 1,
  parameter C_3 = 1,
  parameter C_4 = 1,
  parameter DATA_WIDTH = 32
)
(
    	input clk,
   	 input reset,
 	   input valid_in_1,valid_in_2,valid_in_3,valid_in_4,
    	input [DATA_WIDTH-1:0] pxl_in_1,
    	input [DATA_WIDTH-1:0] pxl_in_2,
    	input [DATA_WIDTH-1:0] pxl_in_3,
    	input [DATA_WIDTH-1:0] pxl_in_4,
    	
    	output [DATA_WIDTH-1:0] pxl_out,
	   output valid_out
	 );
	 parameter T_1 = D * D * C_1;
	 parameter T_2 = D * D * C_2;
	 parameter T_3 = D * D * C_3;
	 parameter T_4 = D * D * C_4;
	 
	 reg [DATA_WIDTH-1:0]memory_1[T_1:0];
	 reg [DATA_WIDTH-1:0]memory_2[T_2:0];
	 reg [DATA_WIDTH-1:0]memory_3[T_3:0];
	 reg [DATA_WIDTH-1:0]memory_4[T_4:0];
	 
	 integer i = 0;
   integer j = 0;
   integer k = 0;
   integer m = 0;
   
   integer g = 0;
   integer h = 0;
   integer l = 0;
   integer n = 0;
   
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
	    if(valid_in_3)begin
	     memory_3[k] = pxl_in_3;
	     k <= k + 1;
	     end
	    if(valid_in_4)begin
	     memory_4[m] = pxl_in_4;
	     m <= m + 1;
	     end   
	   end 
	   
	  /* integer tmp1 = T_1;
	   integer tmp2 = T_2;
	   integer tmp3 = T_3;
	   integer tmp4 = T_4;
	   integer tmp5,tmp6,tmp7;
	   
	   alu_max #(32,32) x0(tmp1, tmp2, tmp5);
	   alu_max #(32,32) x1(tmp5, tmp3, tmp6);
	   alu_max #(32,32) x2(tmp6, tmp4, tmp7);
	   
	   always @ (posedge clk) begin
	     if (tmp1 > tmp2 && tmp3 > tmp4) begin
		    tmp5 = tmp1;
		    tmp6 = tmp3;
	     end 
	     else if (tmp2 > tmp1 & tmp4 > tmp3) begin
		    tmp5 = tmp2;
		    tmp6 = tmp4;
	     end
	     if (tmp5 > tmp6) begin
		    tmp7 = tmp5;
	     end 
	     else if (tmp6 > tmp5) begin
		    tmp7 = tmp6;
	     end
      end*/

	   always @(posedge clk) begin
	   if(m >= T_4 && i >= T_1 && j >= T_2 && k >= T_3 && g < T_1 + 1)begin
	     tmp <= memory_1[g];
	     tmp_valid <= 1;
	     g <= g+1;
	     end 
	    if(g >= T_1 && h < T_2 + 1)begin
	      tmp <= memory_2[h];
	      tmp_valid <= 1;
	       h <= h+1;
	      end
	    if(h >= T_2 && l < T_3 + 1)begin
	      tmp <= memory_3[l];
	      tmp_valid <= 1;
	       l <= l+1;
	      end
	    if(l >= T_3 && n < T_4)begin
	      tmp <= memory_4[n];
	      tmp_valid <= 1;
	       n <= n+1;
	      end
	    else if(n == T_4) tmp_valid = 0;
	   end
	   
	   assign pxl_out = tmp;
	   assign valid_out = tmp_valid;
	   
	   endmodule 

