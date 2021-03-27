module rgb_to_gray(R,G,B,clk,reset,Y);
  input [7:0] R,G,B;
  input clk,reset;
  
  output [31:0] Y;
  
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
                   .i2pEn(i2pEn),
                   .mulEn(mulEn),
                   .addEn(addEn),
                   .f2iEn(f2iEn)
              );
endmodule


