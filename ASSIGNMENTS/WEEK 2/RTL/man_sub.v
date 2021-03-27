module man_sub(
input [7:0]e1,
input [7:0]e2,
input [7:0]eo,
input clk,
input [27:0]m1,m2,
output reg [27:0]mo1,mo2
);

always @(posedge clk) 
begin
if (e1 > e2)	begin
	mo2 = m2 >> eo;
	mo1 = m1;
	end    
else begin
	mo1 = m1 >> eo;
	mo2 = m2;
	  end
end

endmodule
