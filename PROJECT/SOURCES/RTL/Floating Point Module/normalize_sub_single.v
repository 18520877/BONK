module normalize_sub_single(in,ei,out,eo);

	input [26:0] in;
	input [7:0] ei;
	//input clk;
	output reg [26:0] out;
	output  reg [7:0] eo;

	wire [2:0] grs;
	
	assign grs = in[2:0];
	
always @(*) begin
	if(in[26] == 1'b1)begin
		out = {in[26:3],grs[2:0]};
		eo = ei;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b1)begin
		out = {in[25:3],1'd0,grs[2:0]};
		eo = ei - 8'd1;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b1)begin
		out = {in[24:3],2'd0,grs[2:0]};
		eo = ei - 8'd2;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b1)begin
		out = {in[23:3],3'd0,grs[2:0]};
		eo = ei - 8'd3;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b1)begin
		out = {in[22:3],4'd0,grs[2:0]};
		eo = ei - 8'd4;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b1)begin
		out = {in[21:3],5'd0,grs[2:0]};
		eo = ei - 8'd5;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b1)begin
		out = {in[20:3],6'd0,grs[2:0]};
		eo = ei - 8'd6;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b1)begin
		out = {in[19:3],7'd0,grs[2:0]};
		eo = ei - 8'd7;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b1)begin
		out = {in[18:3],8'd0,grs[2:0]};
		eo = ei - 8'd8;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b1)begin
		out = {in[17:3],9'd0,grs[2:0]};
		eo = ei - 8'd9;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b1)begin
		out = {in[16:3],10'd0,grs[2:0]};
		eo = ei - 8'd10;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b1)begin
		out = {in[15:3],11'd0,grs[2:0]};
		eo = ei - 8'd11;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b1)begin
		out = {in[14:3],12'd0,grs[2:0]};
		eo = ei - 8'd12;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b1)begin
		out = {in[13:3],13'd0,grs[2:0]};
		eo = ei - 8'd13;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b1)begin
		out = {in[12:3],14'd0,grs[2:0]};
		eo = ei - 8'd14;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b1)begin
		out = {in[11:3],15'd0,grs[2:0]};
		eo = ei - 8'd15;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b0 && in[10] == 1'b1)begin
		out = {in[10:3],16'd0,grs[2:0]};
		eo = ei - 8'd16;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b0 && in[10] == 1'b0 && in[9] == 1'b1)begin
		out = {in[9:3],17'd0,grs[2:0]};
		eo = ei - 8'd17;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b0 && in[10] == 1'b0 && in[9] == 1'b0 && in[8] == 1'b1)begin
		out = {in[8:3],18'd0,grs[2:0]};
		eo = ei - 8'd18;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b0 && in[10] == 1'b0 && in[9] == 1'b0 && in[8] == 1'b0 && in[7] == 1'b1)begin
		out = {in[7:3],19'd0,grs[2:0]};
		eo = ei - 8'd19;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b0 && in[10] == 1'b0 && in[9] == 1'b0 && in[8] == 1'b0 && in[7] == 1'b0 && in[6] == 1'b1)begin
		out = {in[6:3],20'd0,grs[2:0]};
		eo = ei - 8'd20;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b0 && in[10] == 1'b0 && in[9] == 1'b0 && in[8] == 1'b0 && in[7] == 1'b0 && in[6] == 1'b0 && in[5] == 1'b1)begin
		out = {in[5:3],21'd0,grs[2:0]};
		eo = ei - 8'd21;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b0 && in[10] == 1'b0 && in[9] == 1'b0 && in[8] == 1'b0 && in[7] == 1'b0 && in[6] == 1'b0 && in[5] == 1'b0 && in[4] == 1'b1)begin
		out = {in[4:3],22'd0,grs[2:0]};
		eo = ei - 8'd22;
		end
	else if(in[26] == 1'b0 && in[25] == 1'b0 && in[24] == 1'b0 && in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b0 && in[10] == 1'b0 && in[9] == 1'b0 && in[8] == 1'b0 && in[7] == 1'b0 && in[6] == 1'b0 && in[5] == 1'b0 && in[4] == 1'b0 && in[3] == 1'b1)begin
		out = {in[3],23'd0,grs[2:0]};
		eo = ei - 8'd23;
		end
	else begin
		out = {24'd0,grs[2:0]};
		eo = ei - 8'd24;
		end
end
endmodule



