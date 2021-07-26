`timescale 1ns / 1ps

module tb_inceptionA;
  parameter data_width = 32;
  parameter D = 35;
  parameter T = D*D;
	parameter C = 10;
	parameter I = 20;
	integer i;
	
	reg clk;
	reg reset;
	reg valid_in;
	reg [data_width-1:0] pxl_in;
  reg [data_width-1:0] kernel_00_x0,   
  
  kernel_00_x1, kernel_01_x1, kernel_02_x1,
	 kernel_03_x1, kernel_04_x1, kernel_05_x1,
	 kernel_06_x1, kernel_07_x1, kernel_08_x1, 
	
	kernel_00_x2, kernel_01_x2, kernel_02_x2,
	 kernel_03_x2, kernel_04_x2, kernel_05_x2,
	 kernel_06_x2, kernel_07_x2, kernel_08_x2,
	 
	 kernel_00_x3,
	
	 kernel_00_x4, kernel_01_x4, kernel_02_x4, kernel_03_x4, kernel_04_x4, 
	 kernel_05_x4, kernel_06_x4, kernel_07_x4, kernel_08_x4, kernel_09_x4,
	 kernel_10_x4, kernel_11_x4, kernel_12_x4, kernel_13_x4, kernel_14_x4, 
	 kernel_15_x4, kernel_16_x4, kernel_17_x4, kernel_18_x4, kernel_19_x4,	
	 kernel_20_x4, kernel_21_x4, kernel_22_x4, kernel_23_x4, kernel_24_x4,
	
	 kernel_00_x5,
	
	 kernel_00_x7;
	
	
	reg [data_width-1:0]In[T-1:0];
	reg [data_width-1:0]khongchammot = 32'h3c23d70a;
	//reg [data_width-1:0]mot = 32'h3c23d70a;
  reg [data_width-1:0]Out;
	
	wire [data_width-1:0] pxl_out;
	wire valid_out;
	
initial begin
 	clk = 0;
 	
  kernel_00_x0 = khongchammot;
 	
	 kernel_00_x1= khongchammot; 
	 kernel_01_x1= khongchammot; 
	 kernel_02_x1= khongchammot;
	 kernel_03_x1= khongchammot; 
	 kernel_04_x1= khongchammot; 
	 kernel_05_x1= khongchammot;
	 kernel_06_x1= khongchammot; 
	 kernel_07_x1= khongchammot; 
	 kernel_08_x1= khongchammot; 
	
	 kernel_00_x2= khongchammot; 
	 kernel_01_x2= khongchammot; 
	 kernel_02_x2= khongchammot;
	 kernel_03_x2= khongchammot; 
	 kernel_04_x2= khongchammot; 
	 kernel_05_x2= khongchammot;
	 kernel_06_x2= khongchammot; 
	 kernel_07_x2= khongchammot; 
	 kernel_08_x2= khongchammot;
	 
	 kernel_00_x3= khongchammot;
		
	 kernel_00_x4= khongchammot; 
	 kernel_01_x4= khongchammot;
	 kernel_02_x4= khongchammot; 
	 kernel_03_x4= khongchammot; 
	 kernel_04_x4 = khongchammot; 
	 kernel_05_x4= khongchammot; 
	 kernel_06_x4= khongchammot; 
	 kernel_07_x4= khongchammot;
	 kernel_08_x4= khongchammot; 
	 kernel_09_x4 = khongchammot;
	 kernel_10_x4= khongchammot; 
	 kernel_11_x4= khongchammot; 
	 kernel_12_x4= khongchammot; 
	 kernel_13_x4= khongchammot; 
	 kernel_14_x4 = khongchammot;
	 kernel_15_x4= khongchammot; 
	 kernel_16_x4= khongchammot; 
	 kernel_17_x4= khongchammot; 
	 kernel_18_x4= khongchammot; 
	 kernel_19_x4 = khongchammot;
	 kernel_20_x4= khongchammot; 
	 kernel_21_x4= khongchammot;
	 kernel_22_x4= khongchammot; 
	 kernel_23_x4= khongchammot; 
	 kernel_24_x4 = khongchammot;
	 
  kernel_00_x5 = khongchammot;
  
  kernel_00_x7 = khongchammot;
  
  i=0;
	reset = 0;

  $readmemb("E:/Drive/ICDesign_Seminar/Result/Text/Output_Stem.txt", In);
  Out = $fopen("E:/Drive/ICDesign_Seminar/Result/Text/Output_InceptionA.txt");
	end 
	always #(C) clk = ~ clk;
	
always @(posedge clk) begin
  	valid_in = 1;
  pxl_in = In[i];
  #(I) i = i + 1;
  if(valid_out == 1)begin
    $fdisplay(Out,"%b",pxl_out);
  end
  if(i == (T*10)+3) begin
  $finish;
end
end

	 Inception_A #(data_width) UUT(  
   clk, reset, valid_in,
   pxl_in,
   
   kernel_00_x0,
  
   kernel_00_x1, kernel_01_x1, kernel_02_x1,
	 kernel_03_x1, kernel_04_x1, kernel_05_x1,
	 kernel_06_x1, kernel_07_x1, kernel_08_x1, 
	
	 kernel_00_x2, kernel_01_x2, kernel_02_x2,
	 kernel_03_x2, kernel_04_x2, kernel_05_x2,
	 kernel_06_x2, kernel_07_x2, kernel_08_x2,
	 
	 kernel_00_x3,
	
	 kernel_00_x4, kernel_01_x4, kernel_02_x4, kernel_03_x4, kernel_04_x4, 
	 kernel_05_x4, kernel_06_x4, kernel_07_x4, kernel_08_x4, kernel_09_x4,
	 kernel_10_x4, kernel_11_x4, kernel_12_x4, kernel_13_x4, kernel_14_x4, 
	 kernel_15_x4, kernel_16_x4, kernel_17_x4, kernel_18_x4, kernel_19_x4,	
	 kernel_20_x4, kernel_21_x4, kernel_22_x4, kernel_23_x4, kernel_24_x4,
	
	 kernel_00_x5,
	
	 kernel_00_x7,
	
   pxl_out,
   valid_out
); 

endmodule






