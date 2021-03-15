module int_to_fp (int,clk,float); // convert integer to floating point
input [7:0] int; // integer
input clk;

output reg [31:0] float;

wire [31:0] temp;
assign temp [31:0] = {24'b0,int[7:0]};

wire [31:0] f4,f3,f2,f1,f0;
wire [4:0] s; // shift(to 1.f)

assign s[4] = ~|temp[31:26];
assign f4 = s[4]? {temp[15:0],16'b0} : temp;
assign s[3] =~|f4[31:24]; // 8-bit 0
assign f3 = s[3]? {f4[23:0], 8'b0} : f4;
assign s[2] =~|f3[31:28]; // 4-bit 0
assign f2 = s[2]? {f3[27:0], 4'b0} : f3;
assign s[1] =~|f2[31:30]; // 2-bit 0
assign f1 = s[1]? {f2[29:0], 2'b0} : f2;
assign s[0] =~f1[31]; // 1-bit 0
assign f0 = s[0]? {f1[30:0], 1'b0} : f1;

wire [7:0] exponent = 8'd158 - {3'd0,s}; // 158 = 127 + 31
wire [22:0] mantissa = f0[30:8]; // f0[31] = 1, hidden bit

always @(posedge clk)begin
if (temp == 0)begin
	float <= 0;
	end
else begin
	float <= {1'b0,exponent,mantissa};
	end
	end

endmodule
