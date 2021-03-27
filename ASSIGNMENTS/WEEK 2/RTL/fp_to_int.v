module fp_to_int (float,clk,int); // convert floating point to integer
	input [31:0] float; // float
	input clk;
	
	output reg [31:0] int; // integer

	wire exponent = |float[30:23]; // exponent
	wire mantissa = |float[22:0]; // mantissa
	
	wire zero;
	assign zero =~exponent & mantissa; // error => exp = 0 & man = 1 and out = 0 => exp = 0 & man = 1
	
	wire sign = float[31]; // sign
	
	wire [8:0] sa = 9'd158 - {1'b0,float[30:23]}; // 127 + 31
	wire [55:0] exp0 = {exponent,float[22:0],32'h0}; // 32 +24 =56bit
	wire [55:0] f_abs = ($signed(sa) > 9'd32 ) ? exp0 >> 6'd32 : exp0 >> sa;
	wire [31:0] int32 = sign? ~f_abs[55:24] + 32'd1 : f_abs[55:24];
	
	always @(posedge clk) begin
		
		if (zero) begin //denormalized
			int = 32'd0;
		end 
		else begin // not denormalized
			if (sa[8]) begin // too big
				int = 32'd80000000;
			end 
			else begin // shift right
				if (sa[7:0] > 8'h1f) begin // too small
					int = 32'd0;
				end 
				else begin
					if (sign != int32[31]) begin // out of range
						int = 32'h80000000;
					end 
					else begin
						int = int32;
					end
				end
			end
		end
	end
endmodule
