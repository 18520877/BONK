module ex2(R,G,B,clk,Y);
  input [7:0] R,G,B;
  input clk;
  
  output [31:0] Y;
  
  wire [31:0] i0,i1,i2,o;
  int_to_fp x0(R,clk,i0);
  int_to_fp x1(G,clk,i1);
  int_to_fp x2(B,clk,i2);
  
  rgb_to_gray x3(i0,i1,i2,o,clk);
  
  fp_to_int x4(o,clk,Y);
endmodule
