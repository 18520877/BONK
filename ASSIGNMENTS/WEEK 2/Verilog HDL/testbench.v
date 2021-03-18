`timescale 1ns/1ps

module testbench();
  
  parameter T = 1182721;
  parameter N = 5;
  parameter S = 200;
  integer i;
  
 	reg clk,reset;
	reg [7:0] R,G,B;
	
	reg [7:0] RED[T-1:0];
  reg [7:0] GREEN[T-1:0];
  reg [7:0] BLUE[T-1:0];
  reg [31:0] GRAY;
  
	wire [31:0] Y,Out_i2p0,Out_i2p1,Out_i2p2,Out_m0,Out_m1,Out_m2,a0,Out_add;
	
	initial begin
	  clk=1'b0;
	  reset = 1'b1;
	  $readmemb("R.txt", RED);
    $readmemb("G.txt", GREEN);
    $readmemb("B.txt", BLUE);
    GRAY = $fopen("Y.txt");
    #N
    reset = 1'b0;
    for (i = 0; i < T; i = i + 1 ) begin
      R = RED[i];
      G = GREEN[i];
      B = BLUE[i];
      $fdisplay(GRAY,"%b",Y);
    #S;
  end
  $finish;
	end
	
always @ (clk) begin
   #(N) 
   clk <= !clk;
 end
 
 
rgb_to_gray tb0(.R(R),
                .G(G),
                .B(B),
                .clk(clk),
                .reset(reset),
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
endmodule

