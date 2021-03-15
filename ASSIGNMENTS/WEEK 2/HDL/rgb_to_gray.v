module rgb_to_gray(R,G,B,Y,clk);
  input [31:0] R,G,B;
  input clk;
  output [31:0] Y;
  wire [31:0] out_mul0,out_mul1,out_mul2,out_add;
  
  mul x0(.a(R),.b(32'b00111110100110010001011010000111),.clk(clk),.out(out_mul0));
  mul x1(.a(G),.b(32'b00111111000101100100010110100010),.clk(clk),.out(out_mul1));
  mul x2(.a(B),.b(32'b00111101111010010111100011010101),.clk(clk),.out(out_mul2));
  
  add x3(.a(out_mul0),.b(out_mul1),.clk(clk),.out(out_add));
  add x4(.a(out_add),.b(out_mul2),.clk(clk),.out(Y));
  
endmodule
