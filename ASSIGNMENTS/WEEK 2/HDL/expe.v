module expe(
input [7:0]e1,
input [7:0]e2,
input clk,
output reg [7:0] out,
output reg [7:0] et
);

always @(posedge clk) 
begin
if (e1 > e2)	begin
	et = e1-e2;
	out = e1;
	end    
else begin
	et = e2-e1;
	out = e2;
	  end
end

endmodule
