module normalize_add_single(
input [27:0]in,
input [7:0] ei,
//input clk,
output reg [26:0]out,
output reg[7:0]eo
);

always @(*) 
begin
if (in[27]==1)	begin
	eo <= ei + 1'b1;
	out <= in[26:0] >> 1;
					end    
else begin
	eo <= ei;
	out <= in[26:0];
	  end
end

endmodule


