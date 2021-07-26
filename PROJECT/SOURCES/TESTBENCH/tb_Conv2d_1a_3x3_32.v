`timescale 1ns / 1ps
// Convolution Kernel 3x3, Stride = 2, Padding = 0.

module tb_Conv2d_1a_3x3_32;
  parameter data_width = 32;
  parameter D = 9;
  parameter T = D*D;
	parameter C = 10;
	parameter I = 20;
	integer i;
	/*integer j;
	integer g;*/
	
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
  reg [data_width-1:0]Out32;
  reg [data_width-1:0]Out33;
  reg [data_width-1:0]Out34;
  reg [data_width-1:0]Out35;
  reg [data_width-1:0]Out36;
  reg [data_width-1:0]Out37;
  reg [data_width-1:0]Out38;
  reg [data_width-1:0]Out39;
  reg [data_width-1:0]Out40;
  reg [data_width-1:0]Out41;
  reg [data_width-1:0]Out42;
  reg [data_width-1:0]Out43;
  reg [data_width-1:0]Out44;
  reg [data_width-1:0]Out45;
  reg [data_width-1:0]Out46;
  reg [data_width-1:0]Out47;
  reg [data_width-1:0]Out48;
  reg [data_width-1:0]Out49;
  reg [data_width-1:0]Out50;
  reg [data_width-1:0]Out51;
  reg [data_width-1:0]Out52;
  reg [data_width-1:0]Out53;
  reg [data_width-1:0]Out54;
  reg [data_width-1:0]Out55;
  reg [data_width-1:0]Out56;
  reg [data_width-1:0]Out57;
  reg [data_width-1:0]Out58;
  reg [data_width-1:0]Out59;
  reg [data_width-1:0]Out60;
  reg [data_width-1:0]Out61;
  reg [data_width-1:0]Out62;
  reg [data_width-1:0]Out63;
  reg [data_width-1:0]Out64;
  reg [data_width-1:0]Out65;
  reg [data_width-1:0]Out66;
  reg [data_width-1:0]Out67;
  reg [data_width-1:0]Out68;
  reg [data_width-1:0]Out69;
  reg [data_width-1:0]Out70;
  reg [data_width-1:0]Out71;
  reg [data_width-1:0]Out72;
  reg [data_width-1:0]Out73;
  reg [data_width-1:0]Out74;
  reg [data_width-1:0]Out75;
  reg [data_width-1:0]Out76;
  reg [data_width-1:0]Out77;
  reg [data_width-1:0]Out78;
  reg [data_width-1:0]Out79;
  reg [data_width-1:0]Out80;
  reg [data_width-1:0]Out81;
  reg [data_width-1:0]Out82;
  reg [data_width-1:0]Out83;
  reg [data_width-1:0]Out84;
  reg [data_width-1:0]Out85;
  reg [data_width-1:0]Out86;
  reg [data_width-1:0]Out87;
  reg [data_width-1:0]Out88;
  reg [data_width-1:0]Out89;
  reg [data_width-1:0]Out90;
  reg [data_width-1:0]Out91;
  reg [data_width-1:0]Out92;
  reg [data_width-1:0]Out93;
  reg [data_width-1:0]Out94;
  reg [data_width-1:0]Out95;
  reg [data_width-1:0]Out96;*/

  wire [data_width-1:0] pxl_out_1 , pxl_out_2 , pxl_out_3 , pxl_out_4 , pxl_out_5 , pxl_out_6 , pxl_out_7 , pxl_out_8 , pxl_out_9 , pxl_out_10,
                        pxl_out_11, pxl_out_12, pxl_out_13, pxl_out_14, pxl_out_15, pxl_out_16, pxl_out_17, pxl_out_18, pxl_out_19, pxl_out_20,
	                      pxl_out_21, pxl_out_22, pxl_out_23, pxl_out_24, pxl_out_25, pxl_out_26, pxl_out_27, pxl_out_28, pxl_out_29, pxl_out_30,
                        pxl_out_31, pxl_out_32, pxl_out_33, pxl_out_34, pxl_out_35, pxl_out_36, pxl_out_37, pxl_out_38, pxl_out_39, pxl_out_40,
                        pxl_out_41, pxl_out_42, pxl_out_43, pxl_out_44, pxl_out_45, pxl_out_46, pxl_out_47, pxl_out_48, pxl_out_49, pxl_out_50,
                        pxl_out_51, pxl_out_52, pxl_out_53, pxl_out_54, pxl_out_55, pxl_out_56, pxl_out_57, pxl_out_58, pxl_out_59, pxl_out_60,
                        pxl_out_61, pxl_out_62, pxl_out_63, pxl_out_64, pxl_out_65, pxl_out_66, pxl_out_67, pxl_out_68, pxl_out_69, pxl_out_70,
                        pxl_out_71, pxl_out_72, pxl_out_73, pxl_out_74, pxl_out_75, pxl_out_76, pxl_out_77, pxl_out_78, pxl_out_79, pxl_out_80,
                        pxl_out_81, pxl_out_82, pxl_out_83, pxl_out_84, pxl_out_85, pxl_out_86, pxl_out_87, pxl_out_88, pxl_out_89, pxl_out_90,
                        pxl_out_91, pxl_out_92, pxl_out_93, pxl_out_94, pxl_out_95, pxl_out_96;   
                                              
	               wire   valid_out_1 , valid_out_2 , valid_out_3 , valid_out_4 , valid_out_5 , valid_out_6 , valid_out_7 , valid_out_8 , valid_out_9 , valid_out_10,
                        valid_out_11, valid_out_12, valid_out_13, valid_out_14, valid_out_15, valid_out_16, valid_out_17, valid_out_18, valid_out_19, valid_out_20,
	                      valid_out_21, valid_out_22, valid_out_23, valid_out_24, valid_out_25, valid_out_26, valid_out_27, valid_out_28, valid_out_29, valid_out_30,
                        valid_out_31, valid_out_32, valid_out_33, valid_out_34, valid_out_35, valid_out_36, valid_out_37, valid_out_38, valid_out_39, valid_out_40,
                        valid_out_41, valid_out_42, valid_out_43, valid_out_44, valid_out_45, valid_out_46, valid_out_47, valid_out_48, valid_out_49, valid_out_50,
                        valid_out_51, valid_out_52, valid_out_53, valid_out_54, valid_out_55, valid_out_56, valid_out_57, valid_out_58, valid_out_59, valid_out_60,
                        valid_out_61, valid_out_62, valid_out_63, valid_out_64, valid_out_65, valid_out_66, valid_out_67, valid_out_68, valid_out_69, valid_out_70,
                        valid_out_71, valid_out_72, valid_out_73, valid_out_74, valid_out_75, valid_out_76, valid_out_77, valid_out_78, valid_out_79, valid_out_80,
                        valid_out_81, valid_out_82, valid_out_83, valid_out_84, valid_out_85, valid_out_86, valid_out_87, valid_out_88, valid_out_89, valid_out_90,
                        valid_out_91, valid_out_92, valid_out_93, valid_out_94, valid_out_95, valid_out_96;
                        
initial begin
 	clk = 0;  
 	i=0;
	reset = 0;

  $readmemb("E:/Drive/ICDesign_Seminar/Data/red_32bit.txt", In1);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/green_32bit.txt", In2);
  $readmemb("E:/Drive/ICDesign_Seminar/Data/blue_32bit.txt", In3);
  
  /*Out1 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_1.txt");
  Out2 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_2.txt");
  Out3 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_3.txt");
  Out4 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_4.txt");
  Out5 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_5.txt");
  Out6 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_6.txt");
  Out7 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_7.txt");
  Out8 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_8.txt");
  Out9 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_9.txt");
  Out10 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_10.txt");
  Out11 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_11.txt");
  Out12 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_12.txt");
  Out13 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_13.txt");
  Out14 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_14.txt");
  Out15 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_15.txt");
  Out16 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_16.txt");
  Out17 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_17.txt");
  Out18 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_18.txt");
  Out19 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_19.txt");
  Out20 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_20.txt");
  Out21 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_21.txt");
  Out22 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_22.txt");
  Out23 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_23.txt");
  Out24 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_24.txt");
  Out25 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_25.txt");
  Out26 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_26.txt");
  Out27 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_27.txt");
  Out28 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_28.txt");
  Out29 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_29.txt");
  Out30 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_30.txt");
  Out31 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_31.txt");
  Out32 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_32.txt");
  Out33 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_33.txt");
  Out34 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_34.txt");
  Out35 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_35.txt");
  Out36 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_36.txt");
  Out37 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_37.txt");
  Out38 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_38.txt");
  Out39 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_39.txt");
  Out40 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_40.txt");
  Out41 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_41.txt");
  Out42 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_42.txt");
  Out43 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_43.txt");
  Out44 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_44.txt");
  Out45 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_45.txt");
  Out46 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_46.txt");
  Out47 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_47.txt");
  Out48 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_48.txt");
  Out49 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_49.txt");
  Out50 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_50.txt");
  Out51 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_51.txt");
  Out52 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_52.txt");
  Out53 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_53.txt");
  Out54 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_54.txt");
  Out55 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_55.txt");
  Out56 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_56.txt");
  Out57 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_57.txt");
  Out58 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_58.txt");
  Out59 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_59.txt");
  Out60 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_60.txt");
  Out61 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_61.txt");
  Out62 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_62.txt");
  Out63 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_63.txt");
  Out64 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_64.txt");
  Out65 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_65.txt");
  Out66 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_66.txt");
  Out67 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_67.txt");
  Out68 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_68.txt");
  Out69 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_69.txt");
  Out70 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_70.txt");
  Out71 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_71.txt");
  Out72 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_72.txt");
  Out73 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_73.txt");
  Out74 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_74.txt");
  Out75 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_75.txt");
  Out76 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_76.txt");
  Out77 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_77.txt");
  Out78 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_78.txt");
  Out79 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_79.txt");
  Out80 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_80.txt");
  Out81 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_81.txt");
  Out82 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_82.txt");
  Out83 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_83.txt");
  Out84 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_84.txt");
  Out85 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_85.txt");
  Out86 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_86.txt");
  Out87 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_87.txt");
  Out88 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_88.txt");
  Out89 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_89.txt");
  Out90 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_90.txt");
  Out91 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_91.txt");
  Out92 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_92.txt");
  Out93 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_93.txt");
  Out94 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_94.txt");
  Out95 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_95.txt");
  Out96 = $fopen("E:/Drive/ICDesign_Seminar/Data/output_Conv2d_1a_3x3_32_96.txt");*/

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
  /*if(i >= D*D*2)begin
   	valid_in_2 = 1;
    pxl_in_2 = In2[j];
    j = j + 1;
end
if(j >= D*D*2)begin
   	valid_in_3 = 1;
    pxl_in_3 = In3[g];
    g = g + 1;
end*/
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
    $fdisplay(Out33,"%b",pxl_out_33);
    $fdisplay(Out34,"%b",pxl_out_34);
    $fdisplay(Out35,"%b",pxl_out_35);
    $fdisplay(Out36,"%b",pxl_out_36);
    $fdisplay(Out37,"%b",pxl_out_37);
    $fdisplay(Out38,"%b",pxl_out_38);
    $fdisplay(Out39,"%b",pxl_out_39);
    $fdisplay(Out40,"%b",pxl_out_40);
    $fdisplay(Out41,"%b",pxl_out_41);
    $fdisplay(Out42,"%b",pxl_out_42);
    $fdisplay(Out43,"%b",pxl_out_43);
    $fdisplay(Out44,"%b",pxl_out_44);
    $fdisplay(Out45,"%b",pxl_out_45);
    $fdisplay(Out46,"%b",pxl_out_46);
    $fdisplay(Out47,"%b",pxl_out_47);
    $fdisplay(Out48,"%b",pxl_out_48);
    $fdisplay(Out49,"%b",pxl_out_49);
    $fdisplay(Out50,"%b",pxl_out_50);
    $fdisplay(Out51,"%b",pxl_out_51);
    $fdisplay(Out52,"%b",pxl_out_52);
    $fdisplay(Out53,"%b",pxl_out_53);
    $fdisplay(Out54,"%b",pxl_out_54);
    $fdisplay(Out55,"%b",pxl_out_55);
    $fdisplay(Out56,"%b",pxl_out_56);
    $fdisplay(Out57,"%b",pxl_out_57);
    $fdisplay(Out58,"%b",pxl_out_58);
    $fdisplay(Out59,"%b",pxl_out_59);
    $fdisplay(Out60,"%b",pxl_out_60);
    $fdisplay(Out61,"%b",pxl_out_61);
    $fdisplay(Out62,"%b",pxl_out_62);
    $fdisplay(Out63,"%b",pxl_out_63);
    $fdisplay(Out64,"%b",pxl_out_64);
    $fdisplay(Out65,"%b",pxl_out_65);
    $fdisplay(Out66,"%b",pxl_out_66);
    $fdisplay(Out67,"%b",pxl_out_67);
    $fdisplay(Out68,"%b",pxl_out_68);
    $fdisplay(Out69,"%b",pxl_out_69);
    $fdisplay(Out70,"%b",pxl_out_70);
    $fdisplay(Out71,"%b",pxl_out_71);
    $fdisplay(Out72,"%b",pxl_out_72);
    $fdisplay(Out73,"%b",pxl_out_73);
    $fdisplay(Out74,"%b",pxl_out_74);
    $fdisplay(Out75,"%b",pxl_out_75);
    $fdisplay(Out76,"%b",pxl_out_76);
    $fdisplay(Out77,"%b",pxl_out_77);
    $fdisplay(Out78,"%b",pxl_out_78);
    $fdisplay(Out79,"%b",pxl_out_79);
    $fdisplay(Out80,"%b",pxl_out_80);
    $fdisplay(Out81,"%b",pxl_out_81);
    $fdisplay(Out82,"%b",pxl_out_82);
    $fdisplay(Out83,"%b",pxl_out_83);
    $fdisplay(Out84,"%b",pxl_out_84);
    $fdisplay(Out85,"%b",pxl_out_85);
    $fdisplay(Out86,"%b",pxl_out_86);
    $fdisplay(Out87,"%b",pxl_out_87);
    $fdisplay(Out88,"%b",pxl_out_88);
    $fdisplay(Out89,"%b",pxl_out_89);
    $fdisplay(Out90,"%b",pxl_out_90);
    $fdisplay(Out91,"%b",pxl_out_91);
    $fdisplay(Out92,"%b",pxl_out_92);
    $fdisplay(Out93,"%b",pxl_out_93);
    $fdisplay(Out94,"%b",pxl_out_94);
    $fdisplay(Out95,"%b",pxl_out_95);
    $fdisplay(Out96,"%b",pxl_out_96);
  end*/
  
  if(i == (T*3)+3) begin
  $finish;
end
end

	Conv2d_1a_3x3_32 #(D,data_width) uut (
		clk, 
		reset, 
		valid_in_1, valid_in_2, valid_in_3,
		pxl_in_1, pxl_in_2, pxl_in_3,
		
		                    pxl_out_1 , pxl_out_2 , pxl_out_3 , pxl_out_4 , pxl_out_5 , pxl_out_6 , pxl_out_7 , pxl_out_8 , pxl_out_9 , pxl_out_10,
                        pxl_out_11, pxl_out_12, pxl_out_13, pxl_out_14, pxl_out_15, pxl_out_16, pxl_out_17, pxl_out_18, pxl_out_19, pxl_out_20,
	                      pxl_out_21, pxl_out_22, pxl_out_23, pxl_out_24, pxl_out_25, pxl_out_26, pxl_out_27, pxl_out_28, pxl_out_29, pxl_out_30,
                        pxl_out_31, pxl_out_32, pxl_out_33, pxl_out_34, pxl_out_35, pxl_out_36, pxl_out_37, pxl_out_38, pxl_out_39, pxl_out_40,
                        pxl_out_41, pxl_out_42, pxl_out_43, pxl_out_44, pxl_out_45, pxl_out_46, pxl_out_47, pxl_out_48, pxl_out_49, pxl_out_50,
                        pxl_out_51, pxl_out_52, pxl_out_53, pxl_out_54, pxl_out_55, pxl_out_56, pxl_out_57, pxl_out_58, pxl_out_59, pxl_out_60,
                        pxl_out_61, pxl_out_62, pxl_out_63, pxl_out_64, pxl_out_65, pxl_out_66, pxl_out_67, pxl_out_68, pxl_out_69, pxl_out_70,
                        pxl_out_71, pxl_out_72, pxl_out_73, pxl_out_74, pxl_out_75, pxl_out_76, pxl_out_77, pxl_out_78, pxl_out_79, pxl_out_80,
                        pxl_out_81, pxl_out_82, pxl_out_83, pxl_out_84, pxl_out_85, pxl_out_86, pxl_out_87, pxl_out_88, pxl_out_89, pxl_out_90,
                        pxl_out_91, pxl_out_92, pxl_out_93, pxl_out_94, pxl_out_95, pxl_out_96,
                        
		                    valid_out_1 , valid_out_2 , valid_out_3 , valid_out_4 , valid_out_5 , valid_out_6 , valid_out_7 , valid_out_8 , valid_out_9 , valid_out_10,
                        valid_out_11, valid_out_12, valid_out_13, valid_out_14, valid_out_15, valid_out_16, valid_out_17, valid_out_18, valid_out_19, valid_out_20,
	                      valid_out_21, valid_out_22, valid_out_23, valid_out_24, valid_out_25, valid_out_26, valid_out_27, valid_out_28, valid_out_29, valid_out_30,
                        valid_out_31, valid_out_32, valid_out_33, valid_out_34, valid_out_35, valid_out_36, valid_out_37, valid_out_38, valid_out_39, valid_out_40,
                        valid_out_41, valid_out_42, valid_out_43, valid_out_44, valid_out_45, valid_out_46, valid_out_47, valid_out_48, valid_out_49, valid_out_50,
                        valid_out_51, valid_out_52, valid_out_53, valid_out_54, valid_out_55, valid_out_56, valid_out_57, valid_out_58, valid_out_59, valid_out_60,
                        valid_out_61, valid_out_62, valid_out_63, valid_out_64, valid_out_65, valid_out_66, valid_out_67, valid_out_68, valid_out_69, valid_out_70,
                        valid_out_71, valid_out_72, valid_out_73, valid_out_74, valid_out_75, valid_out_76, valid_out_77, valid_out_78, valid_out_79, valid_out_80,
                        valid_out_81, valid_out_82, valid_out_83, valid_out_84, valid_out_85, valid_out_86, valid_out_87, valid_out_88, valid_out_89, valid_out_90,
                        valid_out_91, valid_out_92, valid_out_93, valid_out_94, valid_out_95, valid_out_96 

	);

endmodule                      