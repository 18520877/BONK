`timescale 1ns / 1ps

module tb_ReB;
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
  reg [data_width-1:0] kernel_00_x1,
	
	 kernel_00_x2, kernel_01_x2, kernel_02_x2,
	 kernel_03_x2, kernel_04_x2, kernel_05_x2,
	 kernel_06_x2, kernel_07_x2, kernel_08_x2,
	 
	 kernel_00_x3,
	 
	 kernel_00_x4, kernel_01_x4, kernel_02_x4, 
	 kernel_03_x4, kernel_04_x4, kernel_05_x4, 
	 kernel_06_x4, kernel_07_x4, kernel_08_x4,
	 
	 kernel_00_x5,
	 
	 kernel_00_x6, kernel_01_x6, kernel_02_x6,
	 kernel_03_x6, kernel_04_x6, kernel_05_x6,
	 kernel_06_x6, kernel_07_x6, kernel_08_x6,
	 
	 kernel_00_x7, kernel_01_x7, kernel_02_x7,
	 kernel_03_x7, kernel_04_x7, kernel_05_x7,
	 kernel_06_x7, kernel_07_x7, kernel_08_x7;
	 
	reg [data_width-1:0]In[T-1:0];
	reg [data_width-1:0]khongchammot = 32'h3c23d70a;
	//reg [data_width-1:0]mot = 32'hba83126f;
  reg [data_width-1:0]Out;
	
	wire [data_width-1:0] pxl_out;
	wire valid_out;
	
initial begin
 	clk = 0;
	
	 kernel_00_x1= khongchammot; 
	
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
	 kernel_04_x4= khongchammot; 
	 kernel_05_x4= khongchammot; 
	 kernel_06_x4= khongchammot; 
	 kernel_07_x4= khongchammot;
	 kernel_08_x4= khongchammot;
	 
	 kernel_00_x5= khongchammot;  
	 
	 kernel_00_x6= khongchammot; 
	 kernel_01_x6= khongchammot; 
	 kernel_02_x6= khongchammot;
	 kernel_03_x6= khongchammot; 
	 kernel_04_x6= khongchammot; 
	 kernel_05_x6= khongchammot;
	 kernel_06_x6= khongchammot; 
	 kernel_07_x6= khongchammot; 
	 kernel_08_x6= khongchammot;
	 
	 kernel_00_x7= khongchammot; 
	 kernel_01_x7= khongchammot; 
	 kernel_02_x7= khongchammot;
	 kernel_03_x7= khongchammot; 
	 kernel_04_x7= khongchammot; 
	 kernel_05_x7= khongchammot;
	 kernel_06_x7= khongchammot; 
	 kernel_07_x7= khongchammot; 
	 kernel_08_x7= khongchammot;
	 
  i=0;
	reset = 0;

  $readmemb("E:/Drive/ICDesign_Seminar/Result/Text/Output_InResB.txt", In);
  Out = $fopen("E:/Drive/ICDesign_Seminar/Result/Text/Output_ReB.txt");
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

	 Reduction_B #(data_width) UUT(  
   clk, reset, valid_in,
   pxl_in,

	 kernel_00_x1,
	
	 kernel_00_x2, kernel_01_x2, kernel_02_x2,
	 kernel_03_x2, kernel_04_x2, kernel_05_x2,
	 kernel_06_x2, kernel_07_x2, kernel_08_x2,
	 
	 kernel_00_x3,
	 
	 kernel_00_x4, kernel_01_x4, kernel_02_x4, 
	 kernel_03_x4, kernel_04_x4, kernel_05_x4, 
	 kernel_06_x4, kernel_07_x4, kernel_08_x4,
	 
	 kernel_00_x5,
	 
	 kernel_00_x6, kernel_01_x6, kernel_02_x6,
	 kernel_03_x6, kernel_04_x6, kernel_05_x6,
	 kernel_06_x6, kernel_07_x6, kernel_08_x6,
	 
	 kernel_00_x7, kernel_01_x7, kernel_02_x7,
	 kernel_03_x7, kernel_04_x7, kernel_05_x7,
	 kernel_06_x7, kernel_07_x7, kernel_08_x7,
		
   pxl_out,
   valid_out
); 

endmodule








