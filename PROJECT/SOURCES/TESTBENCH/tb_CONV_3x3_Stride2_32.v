`timescale 1ns / 1ps
// Convolution Kernel 3x3, Stride = 2, Padding = 0.

module tb_CONV_3x3_Stride2_32;
  parameter data_width = 32;
  parameter D = 49;
  parameter T = D*D;
	parameter C = 10;
	parameter I = 20;
	integer i;
	
	reg clk;
	reg reset;
	reg valid_in_1, valid_in_2, valid_in_3;
	reg [data_width-1:0] pxl_in_1, pxl_in_2, pxl_in_3;

	reg [data_width-1:0]In1[T-1:0];
	reg [data_width-1:0]In2[T-1:0];
	reg [data_width-1:0]In3[T-1:0];
	
  /*reg [data_width-1:0]Out1;
  reg [data_width-1:0]Out2;
  reg [data_width-1:0]Out3;
  reg [data_width-1:0]Out4;
  reg [data_width-1:0]Out5;
  reg [data_width-1:0]Out6;
  reg [data_width-1:0]Out7;
  reg [data_width-1:0]Out8;
  reg [data_width-1:0]Out9;
  reg [data_width-1:0]Out10;
  reg [data_width-1:0]Out11;
  reg [data_width-1:0]Out12;
  reg [data_width-1:0]Out13;
  reg [data_width-1:0]Out14;
  reg [data_width-1:0]Out15;
  reg [data_width-1:0]Out16;
  reg [data_width-1:0]Out17;
  reg [data_width-1:0]Out18;
  reg [data_width-1:0]Out19;
  reg [data_width-1:0]Out20;
  reg [data_width-1:0]Out21;
  reg [data_width-1:0]Out22;
  reg [data_width-1:0]Out23;
  reg [data_width-1:0]Out24;
  reg [data_width-1:0]Out25;
  reg [data_width-1:0]Out26;
  reg [data_width-1:0]Out27;
  reg [data_width-1:0]Out28;
  reg [data_width-1:0]Out29;
  reg [data_width-1:0]Out30;
  reg [data_width-1:0]Out31;
  reg [data_width-1:0]Out32;*/

  wire [data_width-1:0] pxl_out_1 , pxl_out_2 , pxl_out_3 , pxl_out_4 , pxl_out_5 , pxl_out_6 , pxl_out_7 , pxl_out_8 , pxl_out_9 , pxl_out_10,
                        pxl_out_11, pxl_out_12, pxl_out_13, pxl_out_14, pxl_out_15, pxl_out_16, pxl_out_17, pxl_out_18, pxl_out_19, pxl_out_20,
	                      pxl_out_21, pxl_out_22, pxl_out_23, pxl_out_24, pxl_out_25, pxl_out_26, pxl_out_27, pxl_out_28, pxl_out_29, pxl_out_30,
                        pxl_out_31, pxl_out_32;   
                                              
	               wire   valid_out_1 , valid_out_2 , valid_out_3 , valid_out_4 , valid_out_5 , valid_out_6 , valid_out_7 , valid_out_8 , valid_out_9 , valid_out_10,
                        valid_out_11, valid_out_12, valid_out_13, valid_out_14, valid_out_15, valid_out_16, valid_out_17, valid_out_18, valid_out_19, valid_out_20,
	                      valid_out_21, valid_out_22, valid_out_23, valid_out_24, valid_out_25, valid_out_26, valid_out_27, valid_out_28, valid_out_29, valid_out_30,
                        valid_out_31, valid_out_32;
                        
initial begin
 	clk = 0;  
 	i=0;
	reset = 0;

  $readmemb("E:/Drive/ICDesign_Seminar/Data/red_32bit.txt", In1);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/green_32bit.txt", In2);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/blue_32bit.txt", In3);
  
  /*Out1 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_1.txt");
  Out2 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_2.txt");
  Out3 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_3.txt");
  Out4 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_4.txt");
  Out5 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_5.txt");
  Out6 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_6.txt");
  Out7 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_7.txt");
  Out8 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_8.txt");
  Out9 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_9.txt");
  Out10 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_10.txt");
  Out11 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_11.txt");
  Out12 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_12.txt");
  Out13 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_13.txt");
  Out14 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_14.txt");
  Out15 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_15.txt");
  Out16 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_16.txt");
  Out17 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_17.txt");
  Out18 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_18.txt");
  Out19 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_19.txt");
  Out20 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_20.txt");
  Out21 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_21.txt");
  Out22 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_22.txt");
  Out23 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_23.txt");
  Out24 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_24.txt");
  Out25 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_25.txt");
  Out26 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_26.txt");
  Out27 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_27.txt");
  Out28 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_28.txt");
  Out29 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_29.txt");
  Out30 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_30.txt");
  Out31 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_31.txt");
  Out32 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_CONV_3x3_Stride2_32_32.txt");*/
	end 
	
	always #(C) clk = ~ clk;
	
	always @(posedge clk) begin
  	 valid_in_1 = 1;
    pxl_in_1 = In1[i];
    
   	valid_in_2 = 1;
    pxl_in_2 = In2[i];
    
   	valid_in_3 = 1;
    pxl_in_3 = In3[i];
    
  #(I) i = i + 1;
  /*if(valid_out_1)begin
    $fdisplay(Out1,"%b",pxl_out_1);
    $fdisplay(Out2,"%b",pxl_out_2);
    $fdisplay(Out3,"%b",pxl_out_3);
    $fdisplay(Out4,"%b",pxl_out_4);
    $fdisplay(Out5,"%b",pxl_out_5);
    $fdisplay(Out6,"%b",pxl_out_6);
    $fdisplay(Out7,"%b",pxl_out_7);
    $fdisplay(Out8,"%b",pxl_out_8);
    $fdisplay(Out9,"%b",pxl_out_9);
    $fdisplay(Out10,"%b",pxl_out_10);
    $fdisplay(Out11,"%b",pxl_out_11);
    $fdisplay(Out12,"%b",pxl_out_12);
    $fdisplay(Out13,"%b",pxl_out_13);
    $fdisplay(Out14,"%b",pxl_out_14);
    $fdisplay(Out15,"%b",pxl_out_15);
    $fdisplay(Out16,"%b",pxl_out_16);
    $fdisplay(Out17,"%b",pxl_out_17);
    $fdisplay(Out18,"%b",pxl_out_18);
    $fdisplay(Out19,"%b",pxl_out_19);
    $fdisplay(Out20,"%b",pxl_out_20);
    $fdisplay(Out21,"%b",pxl_out_21);
    $fdisplay(Out22,"%b",pxl_out_22);
    $fdisplay(Out23,"%b",pxl_out_23);
    $fdisplay(Out24,"%b",pxl_out_24);
    $fdisplay(Out25,"%b",pxl_out_25);
    $fdisplay(Out26,"%b",pxl_out_26);
    $fdisplay(Out27,"%b",pxl_out_27);
    $fdisplay(Out28,"%b",pxl_out_28);
    $fdisplay(Out29,"%b",pxl_out_29);
    $fdisplay(Out30,"%b",pxl_out_30);
    $fdisplay(Out31,"%b",pxl_out_31);
    $fdisplay(Out32,"%b",pxl_out_32);
  end*/
  
  if(i == (T*3)+3) begin
  $finish;
end
end

	CONV_3x3_Stride2_32 #(D,data_width) uut (
		clk, 
		reset, 
		
		valid_in_1, valid_in_2, valid_in_3,
		pxl_in_1, pxl_in_2, pxl_in_3,
		
		                    pxl_out_1 , pxl_out_2 , pxl_out_3 , pxl_out_4 , pxl_out_5 , pxl_out_6 , pxl_out_7 , pxl_out_8 , pxl_out_9 , pxl_out_10,
                        pxl_out_11, pxl_out_12, pxl_out_13, pxl_out_14, pxl_out_15, pxl_out_16, pxl_out_17, pxl_out_18, pxl_out_19, pxl_out_20,
	                      pxl_out_21, pxl_out_22, pxl_out_23, pxl_out_24, pxl_out_25, pxl_out_26, pxl_out_27, pxl_out_28, pxl_out_29, pxl_out_30,
                        pxl_out_31, pxl_out_32,
                                              
		                    valid_out_1 , valid_out_2 , valid_out_3 , valid_out_4 , valid_out_5 , valid_out_6 , valid_out_7 , valid_out_8 , valid_out_9 , valid_out_10,
                        valid_out_11, valid_out_12, valid_out_13, valid_out_14, valid_out_15, valid_out_16, valid_out_17, valid_out_18, valid_out_19, valid_out_20,
	                      valid_out_21, valid_out_22, valid_out_23, valid_out_24, valid_out_25, valid_out_26, valid_out_27, valid_out_28, valid_out_29, valid_out_30,
                        valid_out_31, valid_out_32

	);

endmodule                      

