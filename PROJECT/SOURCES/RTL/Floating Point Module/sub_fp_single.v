module sub_fp_single(
input [31:0]a,
input [31:0]b,
//input clk,
output reg [31:0] out
);
wire [26:0] mo,mn;
wire [27:0] m1,m2,mt1,mt2,ms;
reg [27:0] mb,ma;
reg [26:0] mc;
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
	if(mt2 == 28'd0) begin
		mb = 28'b1000000000000000000000000000;
		ma = mt1;
	end
	else if(mt2[2:0] == 3'b000)begin
		mb = {mt2[27],(~(mt2[26:3]))+1'b1,3'b000};
		ma = mt1;
		end
	else begin
		mb = {mt2[27],(~(mt2[26:0]))} + 1'b1;
		ma = mt1;
		end
	end
	
else begin
	if(mt1 == 28'd0) begin
		ma = 28'b1000000000000000000000000000;
		mb = mt2;
	end
	else if(mt2[2:0] == 3'b000)begin
		ma = {mt1[27],(~(mt1[26:3]))+1'b1,3'b000};
		mb = mt2;
		end
	else begin
		ma = {mt1[27],(~(mt1[26:0]))} + 1'b1;
		mb = mt2;
		end		
	end	
end
			
assign ms[27:0] = ma + mb;

always @(*)begin
	if(ms[27] == 1)begin
		so = 1'b0;
		mc = {((ms[26:3])+1'b1),ms[2:0]};
	end
	else if(ms[27] == 0 && ms[2:0] == 3'b000)begin
		so = 1'b1;
		mc = {((~(ms[26:3]))+1'b1),3'b000};
		end
	else begin
		so = 1'b1;
		mc = (~ms[26:0]) + 1'b1;
		end
end
normalize_sub_single inst3(	.in(mc[26:0]),
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
	if(a == b)begin
		out[31:0] = 0;
		end
	else begin
		out[31:0] = {so,eout,mout};
		end
end
endmodule



