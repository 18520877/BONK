`timescale 1ns / 1ps

module tb_stem;
  parameter data_width = 32;
  parameter D = 299;
  parameter T = D*D;
	parameter C = 10;
	parameter I = 20;
	integer i;
	
	reg clk;
	reg reset;
	reg valid_in;
	reg [data_width-1:0] pxl_in;
  reg [data_width-1:0]    kernel_00_x0, kernel_01_x0, kernel_02_x0,
	 kernel_03_x0, kernel_04_x0, kernel_05_x0,
	 kernel_06_x0, kernel_07_x0, kernel_08_x0,
	
	 kernel_00_x1, kernel_01_x1, kernel_02_x1,
	 kernel_03_x1, kernel_04_x1, kernel_05_x1,
	 kernel_06_x1, kernel_07_x1, kernel_08_x1, 
	
	 kernel_00_x2, kernel_01_x2, kernel_02_x2,
	 kernel_03_x2, kernel_04_x2, kernel_05_x2,
	 kernel_06_x2, kernel_07_x2, kernel_08_x2,
	 
	 kernel_00_x4,
		
	 kernel_00_x5, kernel_01_x5, kernel_02_x5,
	 kernel_03_x5, kernel_04_x5, kernel_05_x5,
	 kernel_06_x5, kernel_07_x5, kernel_08_x5;
	
	
	reg [data_width-1:0]In[T-1:0];
	reg [data_width-1:0]khongchammot = 32'h3a83126f;
	reg [data_width-1:0]mot = 32'hba83126f;
  reg [data_width-1:0]Out;
	
	wire [data_width-1:0] pxl_out;
	wire valid_out;
	
initial begin
 	clk = 0;
  kernel_00_x0 = khongchammot;
   kernel_01_x0= khongchammot;
   kernel_02_x0= khongchammot;
	 kernel_03_x0= mot; 
	 kernel_04_x0= mot; 
	 kernel_05_x0= mot;
	 kernel_06_x0= khongchammot; 
	 kernel_07_x0= khongchammot; 
	 kernel_08_x0= khongchammot;
	
	 kernel_00_x1= khongchammot; 
	 kernel_01_x1= khongchammot; 
	 kernel_02_x1= khongchammot;
	 kernel_03_x1= mot; 
	 kernel_04_x1= mot; 
	 kernel_05_x1= mot;
	 kernel_06_x1= khongchammot; 
	 kernel_07_x1= khongchammot; 
	 kernel_08_x1= khongchammot; 
	
	 kernel_00_x2= khongchammot; 
	 kernel_01_x2= khongchammot; 
	 kernel_02_x2= khongchammot;
	 kernel_03_x2= mot; 
	 kernel_04_x2= mot; 
	 kernel_05_x2= mot;
	 kernel_06_x2= khongchammot; 
	 kernel_07_x2= khongchammot; 
	 kernel_08_x2= khongchammot;
	 
	 kernel_00_x4= khongchammot;
		
	 kernel_00_x5= khongchammot; 
	 kernel_01_x5= khongchammot; 
	 kernel_02_x5= khongchammot;
	 kernel_03_x5= mot; 
	 kernel_04_x5= mot; 
	 kernel_05_x5= mot;
	 kernel_06_x5= khongchammot; 
	 kernel_07_x5= khongchammot; 
	 kernel_08_x5= khongchammot;

  
  i=0;
	reset = 0;

  $readmemb("E:/Drive/ICDesign_Seminar/Data/ironman_32bit.txt", In);
  Out = $fopen("E:/Drive/ICDesign_Seminar/Result/Text/Output_Stem.txt");
	end 
	always #(C) clk = ~ clk;
	
always @(posedge clk) begin
  	valid_in = 1;
  pxl_in = In[i];
  #(I) i = i + 1;
  if(valid_out == 1)begin
    $fdisplay(Out,"%b",pxl_out);
  end
  if(i == (T*4)+3) begin
  $finish;
end
end

	 Stem #(data_width) UUT(  
   clk, reset, valid_in,
   pxl_in,
  
   kernel_00_x0, kernel_01_x0, kernel_02_x0,
	 kernel_03_x0, kernel_04_x0, kernel_05_x0,
	 kernel_06_x0, kernel_07_x0, kernel_08_x0,
	
	 kernel_00_x1, kernel_01_x1, kernel_02_x1,
	 kernel_03_x1, kernel_04_x1, kernel_05_x1,
	 kernel_06_x1, kernel_07_x1, kernel_08_x1, 
	
	 kernel_00_x2, kernel_01_x2, kernel_02_x2,
	 kernel_03_x2, kernel_04_x2, kernel_05_x2,
	 kernel_06_x2, kernel_07_x2, kernel_08_x2,
	 
	 kernel_00_x4,
		
	 kernel_00_x5, kernel_01_x5, kernel_02_x5,
	 kernel_03_x5, kernel_04_x5, kernel_05_x5,
	 kernel_06_x5, kernel_07_x5, kernel_08_x5,
	
   pxl_out,
   valid_out
); 

endmodule




