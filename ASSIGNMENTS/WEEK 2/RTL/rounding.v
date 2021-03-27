module rounding(
input [26:0]mo,
input clk,
output reg [26:0]mout
);
always @(posedge clk) 
begin
if (mo[2:0]==3'b110 || mo[2:0]==3'b111)begin
	mout = mo + 1'b1;
	end    
else begin
	mout <= mo;
	  end
end

endmodule
