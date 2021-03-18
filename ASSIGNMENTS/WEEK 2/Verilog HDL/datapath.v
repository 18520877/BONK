module datapath(R,G,B,clk,i2pEn,mulEn,addEn,f2iEn,Y,Out_i2p0,Out_i2p1,Out_i2p2,Out_m0,Out_m1,Out_m2,a0,Out_add);
  input [7:0] R,G,B;
  input clk,i2pEn,mulEn,addEn,f2iEn;
  
  output [31:0] Y;
  
  wire [31:0] i0,i1,i2;
  int_to_fp x0(R,clk,i0);
  int_to_fp x1(G,clk,i1);
  int_to_fp x2(B,clk,i2); 
  output [31:0] Out_i2p0,Out_i2p1,Out_i2p2;
  register x3(.out(Out_i2p0), .in(i0), .clk(clk), .en(i2pEn));
  register x4(.out(Out_i2p1), .in(i1), .clk(clk), .en(i2pEn));
  register x5(.out(Out_i2p2), .in(i2), .clk(clk), .en(i2pEn));
  
  wire [31:0] m0,m1,m2;
  mul x6(.a(Out_i2p0),.b(32'b00111110100110010001011010000111),.clk(clk),.out(m0));
  mul x7(.a(Out_i2p1),.b(32'b00111111000101100100010110100010),.clk(clk),.out(m1));
  mul x8(.a(Out_i2p2),.b(32'b00111101111010010111100011010101),.clk(clk),.out(m2)); 
  output [31:0] Out_m0,Out_m1,Out_m2;
  register x9(.out(Out_m0), .in(m0), .clk(clk), .en(mulEn));
  register x10(.out(Out_m1), .in(m1), .clk(clk), .en(mulEn));
  
  wire [31:0] Out_r1,Out_r2,Out_r0,Out_r3,Out_r4;
   register x11(.out(Out_r0), .in(m2), .clk(clk), .en(mulEn));
	register x17(.out(Out_r1), .in(Out_r0), .clk(clk), .en(mulEn)); 
	register x18(.out(Out_r2), .in(Out_r1), .clk(clk), .en(mulEn)); 
	register x19(.out(Out_r3), .in(Out_r2), .clk(clk), .en(mulEn)); 
	register x20(.out(Out_r4), .in(Out_r3), .clk(clk), .en(mulEn)); 
	register x21(.out(Out_m2), .in(Out_r4), .clk(clk), .en(mulEn)); 
  
  output [31:0] a0;
  wire [31:0] a1;
  add x12(.a(Out_m0),.b(Out_m1),.clk(clk),.out(a0));
  add x13(.a(a0),.b(Out_m2),.clk(clk),.out(a1)); 
  output [31:0] Out_add;
  register x14(.out(Out_add), .in(a1), .clk(clk), .en(addEn));
  
  wire [31:0] Out_f2i0;
  fp_to_int x15(Out_add,clk,Out_f2i0);
  register x16(.out(Y), .in(Out_f2i0), .clk(clk), .en(f2iEn));
endmodule




