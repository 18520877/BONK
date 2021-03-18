module rgb_to_gray(R,G,B,clk,reset,Y,Out_i2p0,Out_i2p1,Out_i2p2,Out_m0,Out_m1,Out_m2,a0,Out_add);
  input [7:0] R,G,B;
  input clk,reset;
  
  output [31:0] Y,Out_i2p0,Out_i2p1,Out_i2p2,Out_m0,Out_m1,Out_m2,a0,Out_add;
  
  datapath inst0( .R(R), 
                  .G(G), 
                  .B(B), 
                  .clk(clk), 
                  .i2pEn(i2pEn), 
                  .mulEn(mulEn), 
                  .addEn(addEn), 
                  .f2iEn(f2iEn), 
                  .Y(Y),
						.Out_i2p0(Out_i2p0),
						.Out_i2p1(Out_i2p1),
						.Out_i2p2(Out_i2p2),
						.Out_m0(Out_m0),
						.Out_m1(Out_m1),
						.Out_m2(Out_m2),
						.a0(a0),
						.Out_add(Out_add)
                  );
                  
  controller inst1(.clk(clk),
                   .reset(reset),
                   .i2pEn(i2pEn),
                   .mulEn(mulEn),
                   .addEn(addEn),
                   .f2iEn(f2iEn)
              );
endmodule


