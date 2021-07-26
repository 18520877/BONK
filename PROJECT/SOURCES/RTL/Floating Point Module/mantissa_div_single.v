module mantissa_div_single(
input [23:0]in,
input [7:0]ei,
//input clk,
output reg [22:0]out,
output reg [7:0]eo
);
always @(*) 
begin
	if (in[23] == 1'b1)	begin
		out = in[22:0];
		eo = ei;
	end 
	else if (in[23] == 1'b0 && in[22] == 1'b1)	begin
		out = {in[21:0],1'd0};
		eo = ei - 8'd1;
	end
	else if (in[23] == 1'b0 && in[22] == 1'b0 && in[21]== 1'b1)	begin
		out = {in[20:0],2'd0};
		eo = ei - 8'd2;
	end  
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b1)begin
		out = {in[19:0],3'd0};
		eo = ei - 8'd3;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b1)begin
		out = {in[18:0],4'd0};
		eo = ei - 8'd4;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b1)begin
		out = {in[17:0],5'd0};
		eo = ei - 8'd5;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b1)begin
		out = {in[16:0],6'd0};
		eo = ei - 8'd6;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b1)begin
		out = {in[15:0],7'd0};
		eo = ei - 8'd7;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b1)begin
		out = {in[14:0],8'd0};
		eo = ei - 8'd8;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b1)begin
		out = {in[13:0],9'd0};
		eo = ei - 8'd9;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b1)begin
		out = {in[12:0],10'd0};
		eo = ei - 8'd10;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b1)begin
		out = {in[11:0],11'd0};
		eo = ei - 8'd11;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b1)begin
		out = {in[10:0],12'd0};
		eo = ei - 8'd12;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b0 && in[10] == 1'b1)begin
		out = {in[9:0],13'd0};
		eo = ei - 8'd13;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b0 && in[10] == 1'b0 && in[9] == 1'b1)begin
		out = {in[8:0],14'd0};
		eo = ei - 8'd14;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b0 && in[10] == 1'b0 && in[9] == 1'b0 && in[8] == 1'b1)begin
		out = {in[7:0],15'd0};
		eo = ei - 8'd15;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b0 && in[10] == 1'b0 && in[9] == 1'b0 && in[8] == 1'b0 && in[7] == 1'b1)begin
		out = {in[6:0],16'd0};
		eo = ei - 8'd16;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b0 && in[10] == 1'b0 && in[9] == 1'b0 && in[8] == 1'b0 && in[7] == 1'b0 && in[6] == 1'b1)begin
		out = {in[5:0],17'd0};
		eo = ei - 8'd17;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b0 && in[10] == 1'b0 && in[9] == 1'b0 && in[8] == 1'b0 && in[7] == 1'b0 && in[6] == 1'b0 && in[5] == 1'b1)begin
		out = {in[4:0],18'd0};
		eo = ei - 8'd18;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b0 && in[10] == 1'b0 && in[9] == 1'b0 && in[8] == 1'b0 && in[7] == 1'b0 && in[6] == 1'b0 && in[5] == 1'b0 && in[4] == 1'b1)begin
		out = {in[3:0],19'd0};
		eo = ei - 8'd19;
		end
	else if(in[23] == 1'b0 && in[22] == 1'b0 && in[21] == 1'b0 && in[20] == 1'b0 && in[19] == 1'b0 && in[18] == 1'b0 && in[17] == 1'b0 && in[16] == 1'b0 && in[15] == 1'b0 && in[14] == 1'b0 && in[13] == 1'b0 && in[12] == 1'b0 && in[11] == 1'b0 && in[10] == 1'b0 && in[9] == 1'b0 && in[8] == 1'b0 && in[7] == 1'b0 && in[6] == 1'b0 && in[5] == 1'b0 && in[4] == 1'b0 && in[3] == 1'b1)begin
		out = {in[2:0],20'd0};
		eo = ei - 8'd20;
		end
	else begin
		out = {in[1:0],21'd0};
		eo = ei - 8'd21;
		end
end

endmodule



