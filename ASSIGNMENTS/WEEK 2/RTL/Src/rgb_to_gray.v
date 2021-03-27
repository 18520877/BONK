module rgb_to_gray(R,G,B,clk,reset,invalid,Y,outvalid);
  input [7:0] R,G,B;
  input clk,reset,invalid;
  
  output [31:0] Y;
  output outvalid;
  
  wire i2pEn,mulEn,addEn,f2iEn;
  
  datapath inst0( .R(R), 
                  .G(G), 
                  .B(B), 
                  .clk(clk), 
                  .i2pEn(i2pEn), 
                  .mulEn(mulEn), 
                  .addEn(addEn), 
                  .f2iEn(f2iEn), 
                  .Y(Y)
                  );
                  
  controller inst1(.clk(clk),
                   .reset(reset),
						 .invalid(invalid),
                   .i2pEn(i2pEn),
                   .mulEn(mulEn),
                   .addEn(addEn),
                   .f2iEn(f2iEn),
						 .outvalid(outvalid)
              );
endmodule


