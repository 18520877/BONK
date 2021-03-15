`timescale 1ns/1ps

module testbench();
  
  parameter N = 50;
  parameter S = 120000;
  
 	reg clk;
	reg [7:0] R,G,B;
	
	wire [31:0] Y;
	
	initial begin
	  clk=1'b0;
	  R=8'd0;
	  G=8'd7;
	  B=8'd12;
	  #S
    R=8'd1;
	  G=8'd8;
	  B=8'd3;
    #S
    R=8'd127;
	  G=8'd183;
	  B=8'd219;
	  #S
	  R=8'd172;
	  G=8'd138;
	  B=8'd192;
	  #S
	  R=8'd172;
	  G=8'd172;
	  B=8'd172;
	  #S
	  R=8'd244;
	  G=8'd236;
	  B=8'd214;
	  #S
  		$finish;
	end
	
always @ (clk) begin
   #(N) 
   clk <= !clk;
 end
 
 
ex2 e0(R,G,B,clk,Y);
endmodule

