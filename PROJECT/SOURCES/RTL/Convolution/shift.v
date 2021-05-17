module shift(clk,data_in,data_out/*, hr_0, hr_1, hr_2, hr_3,hr_4,  hr_5,  hr_6,  hr_7,hr_8, hr_9,  hr_10, hr_11,hr_12, hr_13,  hr_14, hr_15*/);

// Depth = D = W - K = 220 - 1 = 219
parameter D = 219;

 input clk;
  input [15:0] data_in;
  
  output [15:0] data_out;
//Xác dinh thanh ghi giu cho tung bit
/*output reg [D-1:0] hr_0;output reg [D-1:0] hr_1;output reg [D-1:0] hr_2;output reg [D-1:0] hr_3;
output reg [D-1:0] hr_4;output reg [D-1:0] hr_5;output reg [D-1:0] hr_6;output reg [D-1:0] hr_7;
output reg [D-1:0] hr_8;output reg [D-1:0] hr_9;output reg [D-1:0] hr_10;output reg [D-1:0] hr_11;
output reg [D-1:0] hr_12;output reg [D-1:0] hr_13;output reg [D-1:0] hr_14;output reg [D-1:0] hr_15;
*/
 reg [D-1:0] hr_0; reg [D-1:0] hr_1; reg [D-1:0] hr_2; reg [D-1:0] hr_3;
 reg [D-1:0] hr_4; reg [D-1:0] hr_5; reg [D-1:0] hr_6; reg [D-1:0] hr_7;
 reg [D-1:0] hr_8; reg [D-1:0] hr_9; reg [D-1:0] hr_10; reg [D-1:0] hr_11;
 reg [D-1:0] hr_12; reg [D-1:0] hr_13; reg [D-1:0] hr_14; reg [D-1:0] hr_15;
always @ (posedge clk) begin
  hr_0 [D-1:0] <= {hr_0[D-2:0], data_in[0]};
  hr_1 [D-1:0] <= {hr_1[D-2:0], data_in[1]};
  hr_2 [D-1:0] <= {hr_2[D-2:0], data_in[2]};
  hr_3 [D-1:0] <= {hr_3[D-2:0], data_in[3]};
  hr_4 [D-1:0] <= {hr_4[D-2:0], data_in[4]};
  hr_5 [D-1:0] <= {hr_5[D-2:0], data_in[5]};
  hr_6 [D-1:0] <= {hr_6[D-2:0], data_in[6]};
  hr_7 [D-1:0] <= {hr_7[D-2:0], data_in[7]};
  hr_8 [D-1:0] <= {hr_8[D-2:0], data_in[8]};
  hr_9 [D-1:0] <= {hr_9[D-2:0], data_in[9]};
  hr_10 [D-1:0] <= {hr_10[D-2:0], data_in[10]};
  hr_11 [D-1:0] <= {hr_11[D-2:0], data_in[11]};
  hr_12 [D-1:0] <= {hr_12[D-2:0], data_in[12]};
  hr_13 [D-1:0] <= {hr_13[D-2:0], data_in[13]};
  hr_14 [D-1:0] <= {hr_14[D-2:0], data_in[14]};
  hr_15 [D-1:0] <= {hr_15[D-2:0], data_in[15]};
end

assign data_out[0] = hr_0[D-1]; assign data_out[1] = hr_1[D-1];
assign data_out[2] = hr_2[D-1]; assign data_out[3] = hr_3[D-1];
assign data_out[4] = hr_4[D-1]; assign data_out[5] = hr_5[D-1];
assign data_out[6] = hr_6[D-1]; assign data_out[7] = hr_7[D-1];
assign data_out[8] = hr_8[D-1]; assign data_out[9] = hr_9[D-1];
assign data_out[10] = hr_10[D-1]; assign data_out[11] = hr_11[D-1];
assign data_out[12] = hr_12[D-1]; assign data_out[13] = hr_13[D-1];
assign data_out[14] = hr_14[D-1]; assign data_out[15] = hr_15[D-1];

endmodule
