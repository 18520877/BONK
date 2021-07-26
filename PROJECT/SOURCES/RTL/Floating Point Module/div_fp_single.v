module div_fp_single(a,b,out);
input [31:0]a;
input [31:0]b;
//input clk;
output reg [31:0] out;

wire [46:0] mo;
wire [22:0] ma,mb,mout;
wire sa,sb,so;
wire [7:0] e1,e2,eo,eout;
wire [7:0]bias = 8'd127;

assign sa = a[31];
assign sb = b[31];
assign so = sa ^ sb;

assign e1[7:0]= a[30:23];
assign e2[7:0]= b[30:23];
assign eo [7:0]= e1 - e2 + bias;

assign ma[22:0] = a[22:0];
assign mb[22:0] = b[22:0];
assign mo[46:0] = ({1'b1,ma,23'd0} / {23'd0,1'b1,mb});
mantissa_div_single inst0(
					.in(mo[23:0]),
					.ei(eo),
					//.clk(clk),
					.out(mout),
					.eo(eout)
					);
always @(*)begin
	if(a==32'd0)begin
		out[31:0] = 0;
		end
	else begin
		out[31:0] = {so,eout,mout};
		end
end
endmodule



