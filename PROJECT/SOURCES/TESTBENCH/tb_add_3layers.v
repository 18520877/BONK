`timescale 1ns / 1ps

module tb_add_3layers;
  parameter data_width = 32;
  parameter D = 299;
  parameter T = D*D;
	parameter C = 10;
	parameter I = 20;
	integer i;
	integer j;
	integer g;
	      reg clk;
	      reg reset;
	
	     	reg valid_in_1,  valid_in_2,  valid_in_3;
    	      
    	  reg [data_width-1:0] pxl_in_1,  pxl_in_2,  pxl_in_3;

	
	reg [data_width-1:0]In1[T-1:0];
	reg [data_width-1:0]In2[T-1:0];
	reg [data_width-1:0]In3[T-1:0];
	
  reg [data_width-1:0]Out;
	
	wire [data_width-1:0] pxl_out;
	wire valid_out;
	
initial begin
 	clk = 0;
  i=0;
  j=0;
  g=0;
	reset = 0;
  $readmemb("E:/Drive/ICDesign_Seminar/Data/red_32bit.txt", In1);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/green_32bit.txt", In2);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/blue_32bit.txt", In3);
  
  Out = $fopen("E:/Drive/ICDesign_Seminar/Result/Text/Output_Add_3layers.txt");
	end 
	always #(C) clk = ~ clk;
	
always @(posedge clk) begin
 	valid_in_1 = 1;
  pxl_in_1 = In1[i];
  #(I) i = i + 1;
  if(i >= D*D)begin
   	valid_in_2 = 1;
    pxl_in_2 = In2[j];
    j = j + 1;
end
if(j >= D*D)begin
   	valid_in_3 = 1;
    pxl_in_3 = In3[g];
    g = g + 1;
end
  if(valid_out == 1)begin
    $fdisplay(Out,"%b",pxl_out);
  end
  if(i == (T*6)+3) begin
  $finish;
end
end

	add_3layers #(D,data_width) uut (
		.clk(clk), 
		.reset(reset), 
		
		.valid_in_1(valid_in_1),
		.valid_in_2(valid_in_2),
		.valid_in_3(valid_in_3),
		
		
		.pxl_in_1(pxl_in_1),
		.pxl_in_2(pxl_in_2),
		.pxl_in_3(pxl_in_3),
		
		
		.pxl_out(pxl_out),
		.valid_out(valid_out)
	);

endmodule










