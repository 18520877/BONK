module shift_33 #(parameter W = 220) (clk,data_in,data_out/*, hr_0, hr_1, hr_2, hr_3,hr_4,  hr_5,  hr_6,  hr_7,hr_8, hr_9,  hr_10, hr_11,hr_12, hr_13,  hr_14, hr_15*/);

// Depth = D = W - K = 220 - 3 = 217
parameter D =  W - 3;

 input clk;
  input [31:0] data_in;
  
  output [31:0] data_out;
//Xác dinh thanh ghi giu cho tung bit
/*output reg [D-1:0] hr_0;output reg [D-1:0] hr_1;output reg [D-1:0] hr_2;output reg [D-1:0] hr_3;
output reg [D-1:0] hr_4;output reg [D-1:0] hr_5;output reg [D-1:0] hr_6;output reg [D-1:0] hr_7;
output reg [D-1:0] hr_8;output reg [D-1:0] hr_9;output reg [D-1:0] hr_10;output reg [D-1:0] hr_11;
output reg [D-1:0] hr_12;output reg [D-1:0] hr_13;output reg [D-1:0] hr_14;output reg [D-1:0] hr_15;
*/
 reg [D-1:0] hr_0; reg [D-1:0] hr_1; reg [D-1:0] hr_2; reg [D-1:0] hr_3;
 reg [D-1:0] hr_4; reg [D-1:0] hr_5; reg [D-1:0] hr_6; reg [D-1:0] hr_7;
 reg [D-1:0] hr_8; reg [D-1:0] hr_9; reg [D-1:0] hr_10; reg [D-1:0] hr_11;
 reg [D-1:0] hr_12; reg [D-1:0] hr_13; reg [D-1:0] hr_14; reg [D-1:0] hr_15,hr_16,hr_17,hr_18,hr_19,hr_20,hr_21,hr_22,hr_23,hr_24,hr_25,hr_26,hr_27,hr_28,hr_29,hr_30,hr_31;

	  
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
  hr_16 [D-1:0] <= {hr_16[D-2:0], data_in[16]};
  hr_17 [D-1:0] <= {hr_17[D-2:0], data_in[17]};
  hr_18 [D-1:0] <= {hr_18[D-2:0], data_in[18]};
  hr_19 [D-1:0] <= {hr_19[D-2:0], data_in[19]};
  hr_20 [D-1:0] <= {hr_20[D-2:0], data_in[20]};
  hr_21 [D-1:0] <= {hr_21[D-2:0], data_in[21]};
  hr_22 [D-1:0] <= {hr_22[D-2:0], data_in[22]};
  hr_23 [D-1:0] <= {hr_23[D-2:0], data_in[23]};
  hr_24 [D-1:0] <= {hr_24[D-2:0], data_in[24]};
  hr_25 [D-1:0] <= {hr_25[D-2:0], data_in[25]};
  hr_26 [D-1:0] <= {hr_26[D-2:0], data_in[26]};
  hr_27 [D-1:0] <= {hr_27[D-2:0], data_in[27]};
  hr_28 [D-1:0] <= {hr_28[D-2:0], data_in[28]};
  hr_29 [D-1:0] <= {hr_29[D-2:0], data_in[29]};
  hr_30 [D-1:0] <= {hr_30[D-2:0], data_in[30]};
  hr_31 [D-1:0] <= {hr_31[D-2:0], data_in[31]};
end

assign data_out[0] = hr_0[D-1]; assign data_out[1] = hr_1[D-1];
assign data_out[2] = hr_2[D-1]; assign data_out[3] = hr_3[D-1];
assign data_out[4] = hr_4[D-1]; assign data_out[5] = hr_5[D-1];
assign data_out[6] = hr_6[D-1]; assign data_out[7] = hr_7[D-1];
assign data_out[8] = hr_8[D-1]; assign data_out[9] = hr_9[D-1];
assign data_out[10] = hr_10[D-1]; assign data_out[11] = hr_11[D-1];
assign data_out[12] = hr_12[D-1]; assign data_out[13] = hr_13[D-1];
assign data_out[14] = hr_14[D-1]; assign data_out[15] = hr_15[D-1];
assign data_out[16] = hr_16[D-1]; assign data_out[17] = hr_17[D-1];
assign data_out[18] = hr_18[D-1]; assign data_out[19] = hr_19[D-1];
assign data_out[20] = hr_20[D-1]; assign data_out[21] = hr_21[D-1];
assign data_out[22] = hr_22[D-1]; assign data_out[23] = hr_23[D-1];
assign data_out[24] = hr_24[D-1]; assign data_out[25] = hr_25[D-1];
assign data_out[26] = hr_26[D-1]; assign data_out[27] = hr_27[D-1];
assign data_out[28] = hr_28[D-1]; assign data_out[29] = hr_29[D-1];
assign data_out[30] = hr_30[D-1]; assign data_out[31] = hr_31[D-1];
endmodule




