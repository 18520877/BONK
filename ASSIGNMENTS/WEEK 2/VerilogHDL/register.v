module register(out, in, clk, en);

	input [31:0] in;
	input clk,en;
	output reg [31:0] out;
	
	always @(posedge clk)
	begin
	  if(en) begin
		  	out <= in;
        end
	end
endmodule
		