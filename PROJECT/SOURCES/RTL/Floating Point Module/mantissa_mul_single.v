module mantissa_mul_single(
input [47:0]mo,
input [7:0] eo,
//input clk,
output reg [22:0]mout,
output reg[7:0]eout
);
always @(*) 
begin
if (mo[47]==1)	begin
	eout <= eo +1'b1;
	mout <= mo[46:24];
					end    
else begin
	eout <= eo;
	mout <= mo[45:23];
	  end
end

endmodule



