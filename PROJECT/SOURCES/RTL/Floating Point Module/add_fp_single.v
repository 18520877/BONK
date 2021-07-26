module add_fp_single(
input [31:0]a,
input [31:0]b,
//input clk,
output reg [31:0] out

);
reg [31:0] tmp;

wire [26:0] mo,mn;
wire [27:0] m1,m2,mt1,mt2,ms;
wire [22:0] mout;
reg so;
wire [7:0] eo,c,eout;

expe_single inst1(		.e1(a[30:23]), 
					.e2(b[30:23]), 
					//.clk(clk),
					.out(eo), 
					.et(c)
			);
			
assign m1[27:0] = {2'b01,a[22:0],3'b000};
assign m2[27:0] = {2'b01,b[22:0],3'b000};
 
man_sub_single inst2(	.e1(a[30:23]), 
				.e2(b[30:23]), 
				.eo(c), 
				.m1(m1), 
				.m2(m2),
				//.clk(clk), 
				.mo1(mt1), 
				.mo2(mt2)
			);
	
always @(*)begin
if(a[31] == 0 && b[31] == 0)begin
	so = 1'b0;
end
else begin
	so = 1'b1;	
end	
end	
 
assign ms[27:0] = mt1 + mt2;


normalize_add_single inst3(	.in(ms[27:0]),
						.ei(eo),
						//.clk(clk),
						.out(mn),
						.eo(eout)
						);

rounding_single inst0(
					.mo(mn),
					//.clk(clk),
					.mout(mo)
					);
	
assign mout[22:0] = mo[25:3];		

always @(*)begin
	if(a==32'd0 && b==32'd0)begin
		tmp[31:0] = 0;
		end
	else begin
		tmp[31:0] = {so,eout,mout};
		end
end

always @(*)begin
  if(tmp[10] == 1 || tmp[10] == 0) out = tmp;
 end

endmodule



