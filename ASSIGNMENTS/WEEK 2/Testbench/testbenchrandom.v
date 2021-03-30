`timescale 1ns/1ps

module testbench();
  
  parameter T = 76800;
  parameter N = 5;
  parameter S = 4000;
  integer i;
  reg [1:0] X;
  
 	reg clk,reset,invalid;
	reg [7:0] R,G,B;
	
	reg [7:0] red[T-1:0];
  reg [7:0] green[T-1:0];
  reg [7:0] blue[T-1:0];
  reg [31:0] gray;
  
	wire [31:0] Y;
	wire outvalid;
	
	initial begin
    X=0;
	  i=0;
	  clk=1'b0;
	  reset = 1'b1;
	  $readmemb("red.txt", red);
    $readmemb("green.txt", green);
    $readmemb("blue.txt", blue);
    gray = $fopen("gray.txt");
    #(N+1)  
    reset = 1'b0;
	end

always @ (clk) begin
   #(N) 
   clk <= !clk;
 end

always @(clk)begin
  if(!reset & !clk) begin
    invalid = 1'b1;
  end
else begin
  #X
    invalid = 1'b0;
  end
end

always @(posedge invalid) begin
 	X = $urandom;
  R = red[i];
  G = green[i];
  B = blue[i];
  if(outvalid == 1'b1) begin
      $fdisplay(gray,"%b",Y);
      i = i + 1;
  end
  if(i == T) begin
    #S
  $finish;
end
end
 
rgb_to_gray tb0(.R(R),
                .G(G),
                .B(B),
                .clk(clk),
                .reset(reset),
                .invalid(invalid),
                .Y(Y),
                .outvalid(outvalid)
                  );
endmodule

