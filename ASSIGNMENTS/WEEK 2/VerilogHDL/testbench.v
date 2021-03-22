`timescale 1ns/1ps

module testbench();
  
  parameter T = 76800;
  parameter N = 5;
  parameter S = 250;
  integer i;
  
 	reg clk,reset;
	reg [7:0] R,G,B;
	
	reg [7:0] red[T-1:0];
  reg [7:0] green[T-1:0];
  reg [7:0] blue[T-1:0];
  reg [31:0] gray;
  
	wire [31:0] Y;
	
	initial begin
	  clk=1'b0;
	  reset = 1'b1;
	  $readmemb("red.txt", red);
    $readmemb("green.txt", green);
    $readmemb("blue.txt", blue);
    gray = $fopen("gray.txt");
    #6
    reset = 1'b0;
    for (i = 0; i <= T; i = i + 1 ) begin
      R = red[i];
      G = green[i];
      B = blue[i];
      $fdisplay(gray,"%b",Y);
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
                .Y(Y)
                  );
endmodule

