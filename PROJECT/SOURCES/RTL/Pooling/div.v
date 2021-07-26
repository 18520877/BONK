module div 
#(	parameter k = 32,
parameter N = ""
)
(in, out);
	 
	input [k-1:0] in;
	
 	output [k-1:0] out;

	wire [k-1:0] nine = N;
	
	div_fp_single div_fp_inst ( .a(in),
	                     .b(nine),
	                     .out(out)
	                     );    

endmodule 



