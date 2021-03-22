module add(
input [31:0]a,
input [31:0]b,
input clk,
output reg[31:0] out
);
wire [26:0] mo,mn;
wire [27:0] m1,m2,mt1,mt2,ms;
reg [27:0] mb,ma;
wire [22:0] mout;
reg so;
wire [7:0] eo,c,eout;



expe inst1(		.e1(a[30:23]), 
					.e2(b[30:23]), 
					.clk(clk),
					.out(eo), 
					.et(c)
			);
			
assign m1[27:0] = {2'b01,a[22:0],3'b000};
assign m2[27:0] = {2'b01,b[22:0],3'b000};

man_sub inst2(	.e1(a[30:23]), 
				.e2(b[30:23]), 
				.eo(c), 
				.m1(m1), 
				.m2(m2),
				.clk(clk), 
				.mo1(mt1), 
				.mo2(mt2)
			);
	
always @(posedge clk)begin
if(a[31] == 0 && b[31] == 0)begin
	so = 1'b0;
end
else begin
	so = 1'b1;	
end	
end	
assign ms[27:0] = mt1 + mt2;

normalize_add inst3(	.in(ms[27:0]),
						.ei(eo),
						.clk(clk),
						.out(mn),
						.eo(eout)
						);
				

rounding inst0(
					.mo(mn),
					.clk(clk),
					.mout(mo)
					);
	
assign mout[22:0] = mo[25:3];		

always @(posedge clk)begin
	if(a==32'd0 && b==32'd0)begin
		out[31:0] = 0;
		end
	else begin
		out[31:0] = {so,eout,mout};
		end
end

endmodule
