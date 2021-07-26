module div_fp(a,b,valid_in,out,valid_out);
input [31:0]a;
input [31:0]b;
input valid_in;
output reg [31:0] out;
output reg valid_out;

wire [46:0] mo;
wire [22:0] ma,mb,mout;
wire sa,sb,so;
wire [7:0] e1,e2,eo,eout;
wire [7:0]bias = 8'd127;

reg [31:0] tmp_a,tmp_b;

always @(*)begin
	if(valid_in==1)begin
		tmp_a = a;
		tmp_b = b;
		end
end
assign sa = tmp_a[31];
assign sb = tmp_b[31];
assign so = sa ^ sb;

assign e1[7:0]= tmp_a[30:23];
assign e2[7:0]= tmp_b[30:23];
assign eo [7:0]= e1 - e2 + bias;

assign ma[22:0] = tmp_a[22:0];
assign mb[22:0] = tmp_b[22:0];
assign mo[46:0] = ({1'b1,ma,23'd0} / {23'd0,1'b1,mb});
mantissa_div_single inst0(
					.in(mo[23:0]),
					.ei(eo),
					//.clk(clk),
					.out(mout),
					.eo(eout)
					);
always @(*)begin
	if(tmp_a==32'd0)begin
		out[31:0] = 0;
		valid_out = 1;
		end
	else if (tmp_a != 0 && tmp_b != 0) begin
		out[31:0] = {so,eout,mout};
		valid_out = 1;
		end
	else begin
	  out[31:0] = 0;
		valid_out = 0;
	  end
end
endmodule

