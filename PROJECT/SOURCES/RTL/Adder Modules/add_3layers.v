 module add_3layers
#(
  parameter D = 220,
  parameter DATA_WIDTH = 32)
(
    	input clk,
     	input reset,
     	input valid_in_1,  valid_in_2,  valid_in_3,
     	input [DATA_WIDTH-1:0] pxl_in_1,  pxl_in_2,  pxl_in_3,
     	 	     	
    	output [DATA_WIDTH-1:0] pxl_out,
	   output valid_out
	 );
	 
	   wire [DATA_WIDTH-1:0] pxl_out_1;
	   wire valid_out_1;
	     
	  add_layer #(D,DATA_WIDTH) x1( .clk(clk),
                  .reset(reset),
                  .valid_in_1(valid_in_1),               
                  .valid_in_2(valid_in_2),
                  
                  .pxl_in_1(pxl_in_1),
                  .pxl_in_2(pxl_in_2),
                  
                  .pxl_out(pxl_out_1),
                  .valid_out(valid_out_1)
                  );
      add_layer #(D,DATA_WIDTH) x2( .clk(clk),
                  .reset(reset),
                  .valid_in_1(valid_in_3),               
                  .valid_in_2(valid_out_1),
                  
                  .pxl_in_1(pxl_in_3),
                  .pxl_in_2(pxl_out_1),
                  
                  .pxl_out(pxl_out),
                  .valid_out(valid_out)
                  );

endmodule

