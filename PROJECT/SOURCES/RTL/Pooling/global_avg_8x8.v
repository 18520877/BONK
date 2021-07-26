//Global Average Pooling 8x8

module global_avg_8x8
#(parameter D = 8,
  parameter DATA_WIDTH = 32)
(
      //input
    	input clk,
 	 	 input reset,valid_in,
    	input [DATA_WIDTH-1:0] pxl_in,
			//output
    	
	   output [DATA_WIDTH-1:0] pxl_out,
	   output  valid_out

    );
    
	parameter W = D;	//Weight
	parameter H = D;	//Height
	parameter K = 3;

	 reg [DATA_WIDTH-1:0] tmp7;
	 wire [DATA_WIDTH-1:0] tmp8;
  
	wire [DATA_WIDTH-1:0]  cell_00  , cell_01  , cell_02  , cell_03  , cell_04  , cell_05  , cell_06  , cell_07 ,
		                         cell_220 , cell_221 , cell_222 , cell_223 , cell_224 , cell_225 , cell_226 , cell_227, 
	                           cell_440 , cell_441 , cell_442 , cell_443 , cell_444 , cell_445 , cell_446 , cell_447,
	                           cell_660 , cell_661 , cell_662 , cell_663 , cell_664 , cell_665 , cell_666 , cell_667,	                           
	                           cell_880 , cell_881 , cell_882 , cell_883 , cell_884 , cell_885 , cell_886 , cell_887,
	                           cell_1100, cell_1101, cell_1102, cell_1103, cell_1104, cell_1105, cell_1106, cell_1107,	                           	                           
	                           cell_1320, cell_1321, cell_1322, cell_1323, cell_1324, cell_1325, cell_1326, cell_1327,	                         	                           
	                           cell_1540, cell_1541, cell_1542, cell_1543, cell_1544, cell_1545, cell_1546, cell_1547;
	                           
  wire [DATA_WIDTH-1:0]  reg_00  , reg_01  , reg_02  , reg_03  , reg_04  , reg_05  , reg_06  , reg_07  ,
		                         reg_220 , reg_221 , reg_222 , reg_223 , reg_224 , reg_225 , reg_226 , reg_227 ,
	                           reg_440 , reg_441 , reg_442 , reg_443 , reg_444 , reg_445 , reg_446 , reg_447 , 
	                           reg_660 , reg_661 , reg_662 , reg_663 , reg_664 , reg_665 , reg_666 , reg_667 ,	                          
	                           reg_880 , reg_881 , reg_882 , reg_883 , reg_884 , reg_885 , reg_886 , reg_887 , 
	                           reg_1100, reg_1101, reg_1102, reg_1103, reg_1104, reg_1105, reg_1106, reg_1107,	                           	                           
	                           reg_1320, reg_1321, reg_1322, reg_1323, reg_1324, reg_1325, reg_1326, reg_1327,	                       	                           
	                           reg_1540, reg_1541, reg_1542, reg_1543, reg_1544, reg_1545, reg_1546, reg_1547;
	                           
                          
	wire [DATA_WIDTH-1:0] tmp_out;

	reg [DATA_WIDTH-1:0] memory [(D*D)-1:0];
	reg valid_memory;
	integer i = 0;
	integer j = 0;
	
	always @(posedge clk)begin
	 if(reset)begin
	   memory[i] <= 0;
	   valid_memory = 1'b0;
	   end
	 else if(valid_in == 1'b1 && i < D*D)begin
	   memory[i] <= pxl_in;
	   i<=i+1;
	   valid_memory = 1'b0;
	   end
	else if(i == D*D)begin
	  valid_memory = 1'b1;
	  end
	 end
	  
	 always @(posedge clk)begin
	if(valid_memory == 1'b1)begin
	   tmp7 <= memory[j];
	   j <=j+1;
	 end
	   	 end
	  assign tmp8 = tmp7;
	 
	//Hang 1
	add #(DATA_WIDTH) alu_00(tmp8, 32'd0, cell_00);
	register #(DATA_WIDTH) r_00(clk, reset, cell_00, reg_00); 

	add #(DATA_WIDTH) alu_01(tmp8, reg_00, cell_01); 
	register #(DATA_WIDTH) r_01(clk, reset, cell_01, reg_01); 

	add #(DATA_WIDTH) alu_02(tmp8, reg_01, cell_02); 
	register #(DATA_WIDTH) r_02(clk, reset, cell_02, reg_02); 
	
	add #(DATA_WIDTH) alu_03(tmp8, reg_02, cell_03); 
	register #(DATA_WIDTH) r_03(clk, reset, cell_03, reg_03); 
	
	add #(DATA_WIDTH) alu_04(tmp8, reg_03, cell_04); 
	register #(DATA_WIDTH) r_04(clk, reset, cell_04, reg_04); 
	
	add #(DATA_WIDTH) alu_05(tmp8, reg_04, cell_05); 
	register #(DATA_WIDTH) r_05(clk, reset, cell_05, reg_05); 
	
	add #(DATA_WIDTH) alu_06(tmp8, reg_05, cell_06); 
	register #(DATA_WIDTH) r_06(clk, reset, cell_06, reg_06); 
	
	add #(DATA_WIDTH) alu_07(tmp8, reg_06, cell_07); 
	register #(DATA_WIDTH) r_07(clk, reset, cell_07, reg_07); 
	

	//Hang 2
	add #(DATA_WIDTH) alu_220(tmp8, reg_07, cell_220); 
	register #(DATA_WIDTH) r_10(clk, reset, cell_220, reg_220); 

	add #(DATA_WIDTH) alu_221(tmp8, reg_220, cell_221); 
	register #(DATA_WIDTH) r_11(clk, reset, cell_221, reg_221); 

	add #(DATA_WIDTH) alu_222(tmp8, reg_221, cell_222); 
	register #(DATA_WIDTH) r_12(clk, reset, cell_222, reg_222); 
  
  add #(DATA_WIDTH) alu_223(tmp8, reg_222, cell_223); 
	register #(DATA_WIDTH) r_13(clk, reset, cell_223, reg_223); 
	
	add #(DATA_WIDTH) alu_224(tmp8, reg_223, cell_224); 
	register #(DATA_WIDTH) r_14(clk, reset, cell_224, reg_224); 
	
	add #(DATA_WIDTH) alu_225(tmp8, reg_224, cell_225); 
	register #(DATA_WIDTH) r_15(clk, reset, cell_225, reg_225); 
	
	add #(DATA_WIDTH) alu_226(tmp8, reg_225, cell_226); 
	register #(DATA_WIDTH) r_16(clk, reset, cell_226, reg_226); 
	
	add #(DATA_WIDTH) alu_227(tmp8, reg_226, cell_227); 
	register #(DATA_WIDTH) r_17(clk, reset, cell_227, reg_227);
	 

	//Hang 3

	add #(DATA_WIDTH) alu_440(tmp8, reg_227, cell_440); 
	register #(DATA_WIDTH) r_20(clk, reset, cell_440, reg_440); 

	add #(DATA_WIDTH) alu_441(tmp8, reg_440, cell_441); 
	register #(DATA_WIDTH) r_21(clk, reset, cell_441, reg_441); 

	add #(DATA_WIDTH) alu_442(tmp8, reg_441, cell_442); 
	register #(DATA_WIDTH) r_22(clk, reset, cell_442, reg_442);
	
	add #(DATA_WIDTH) alu_443(tmp8, reg_442, cell_443); 
	register #(DATA_WIDTH) r_23(clk, reset, cell_443, reg_443);
	
	add #(DATA_WIDTH) alu_444(tmp8, reg_443, cell_444); 
	register #(DATA_WIDTH) r_24(clk, reset, cell_444, reg_444);
	
	add #(DATA_WIDTH) alu_445(tmp8, reg_444, cell_445); 
	register #(DATA_WIDTH) r_25(clk, reset, cell_445, reg_445);
	
	add #(DATA_WIDTH) alu_446(tmp8, reg_445, cell_446); 
	register #(DATA_WIDTH) r_26(clk, reset, cell_446, reg_446);
	
	add #(DATA_WIDTH) alu_447(tmp8, reg_446, cell_447); 
	register #(DATA_WIDTH) r_27(clk, reset, cell_447, reg_447);


  //Hang 4

	add #(DATA_WIDTH) alu_660(tmp8, reg_447, cell_660); 
	register #(DATA_WIDTH) r_40(clk, reset, cell_660, reg_660); 

	add #(DATA_WIDTH) alu_661(tmp8, reg_660, cell_661); 
	register #(DATA_WIDTH) r_41(clk, reset, cell_661, reg_661); 

	add #(DATA_WIDTH) alu_662(tmp8, reg_661, cell_662); 
	register #(DATA_WIDTH) r_42(clk, reset, cell_662, reg_662);
	
	add #(DATA_WIDTH) alu_663(tmp8, reg_662, cell_663); 
	register #(DATA_WIDTH) r_43(clk, reset, cell_663, reg_663);
	
	add #(DATA_WIDTH) alu_664(tmp8, reg_663, cell_664); 
	register #(DATA_WIDTH) r_44(clk, reset, cell_664, reg_664);
	
	add #(DATA_WIDTH) alu_665(tmp8, reg_664, cell_665); 
	register #(DATA_WIDTH) r_45(clk, reset, cell_665, reg_665);
	
	add #(DATA_WIDTH) alu_666(tmp8, reg_665, cell_666); 
	register #(DATA_WIDTH) r_46(clk, reset, cell_666, reg_666);
	
	add #(DATA_WIDTH) alu_667(tmp8, reg_666, cell_667); 
	register #(DATA_WIDTH) r_47(clk, reset, cell_667, reg_667);

  
  //Hang 5

	add #(DATA_WIDTH) alu_880(tmp8, reg_667, cell_880); 
	register #(DATA_WIDTH) r_60(clk, reset, cell_880, reg_880); 

	add #(DATA_WIDTH) alu_881(tmp8, reg_880, cell_881); 
	register #(DATA_WIDTH) r_61(clk, reset, cell_881, reg_881); 

	add #(DATA_WIDTH) alu_882(tmp8, reg_881, cell_882); 
	register #(DATA_WIDTH) r_62(clk, reset, cell_882, reg_882);
	
	add #(DATA_WIDTH) alu_883(tmp8, reg_882, cell_883); 
	register #(DATA_WIDTH) r_63(clk, reset, cell_883, reg_883);
	
	add #(DATA_WIDTH) alu_884(tmp8, reg_883, cell_884); 
	register #(DATA_WIDTH) r_64(clk, reset, cell_884, reg_884);
	
	add #(DATA_WIDTH) alu_885(tmp8, reg_884, cell_885); 
	register #(DATA_WIDTH) r_65(clk, reset, cell_885, reg_885);
	
	add #(DATA_WIDTH) alu_887(tmp8, reg_885, cell_886); 
	register #(DATA_WIDTH) r_66(clk, reset, cell_886, reg_886);
	
	add #(DATA_WIDTH) alu_888(tmp8, reg_886, cell_887); 
	register #(DATA_WIDTH) r_67(clk, reset, cell_887, reg_887);

  
  //Hang 6

	add #(DATA_WIDTH) alu_1100(tmp8, reg_887, cell_1100); 
	register #(DATA_WIDTH) r_80(clk, reset, cell_1100, reg_1100); 

	add #(DATA_WIDTH) alu_1101(tmp8, reg_1100, cell_1101); 
	register #(DATA_WIDTH) r_81(clk, reset, cell_1101, reg_1101); 

	add #(DATA_WIDTH) alu_1102(tmp8, reg_1101, cell_1102); 
	register #(DATA_WIDTH) r_82(clk, reset, cell_1102, reg_1102);
	
	add #(DATA_WIDTH) alu_1103(tmp8, reg_1102, cell_1103); 
	register #(DATA_WIDTH) r_83(clk, reset, cell_1103, reg_1103);
	
	add #(DATA_WIDTH) alu_1104(tmp8, reg_1103, cell_1104); 
	register #(DATA_WIDTH) r_84(clk, reset, cell_1104, reg_1104);
	
	add #(DATA_WIDTH) alu_1105(tmp8, reg_1104, cell_1105); 
	register #(DATA_WIDTH) r_85(clk, reset, cell_1105, reg_1105);
	
	add #(DATA_WIDTH) alu_1106(tmp8, reg_1105, cell_1106); 
	register #(DATA_WIDTH) r_86(clk, reset, cell_1106, reg_1106);
	
	add #(DATA_WIDTH) alu_1107(tmp8, reg_1106, cell_1107); 
	register #(DATA_WIDTH) r_87(clk, reset, cell_1107, reg_1107);

  
  //Hang 7

	add #(DATA_WIDTH) alu_1320(tmp8, reg_1107, cell_1320); 
	register #(DATA_WIDTH) r_100(clk, reset, cell_1320, reg_1320); 

	add #(DATA_WIDTH) alu_1321(tmp8, reg_1320, cell_1321); 
	register #(DATA_WIDTH) r_101(clk, reset, cell_1321, reg_1321); 

	add #(DATA_WIDTH) alu_1322(tmp8, reg_1321, cell_1322); 
	register #(DATA_WIDTH) r_102(clk, reset, cell_1322, reg_1322);
	
	add #(DATA_WIDTH) alu_1323(tmp8, reg_1322, cell_1323); 
	register #(DATA_WIDTH) r_103(clk, reset, cell_1323, reg_1323);
	
	add #(DATA_WIDTH) alu_1324(tmp8, reg_1323, cell_1324); 
	register #(DATA_WIDTH) r_104(clk, reset, cell_1324, reg_1324);
	
	add #(DATA_WIDTH) alu_1325(tmp8, reg_1324, cell_1325); 
	register #(DATA_WIDTH) r_105(clk, reset, cell_1325, reg_1325);
	
	add #(DATA_WIDTH) alu_1326(tmp8, reg_1325, cell_1326); 
	register #(DATA_WIDTH) r_106(clk, reset, cell_1326, reg_1326);
	
	add #(DATA_WIDTH) alu_1327(tmp8, reg_1326, cell_1327); 
	register #(DATA_WIDTH) r_107(clk, reset, cell_1327, reg_1327);

  
  //Hang 8

	add #(DATA_WIDTH) alu_1540(tmp8, reg_1327, cell_1540); 
	register #(DATA_WIDTH) r_120(clk, reset, cell_1540, reg_1540); 

	add #(DATA_WIDTH) alu_1541(tmp8, reg_1540, cell_1541); 
	register #(DATA_WIDTH) r_121(clk, reset, cell_1541, reg_1541); 

	add #(DATA_WIDTH) alu_1542(tmp8, reg_1541, cell_1542); 
	register #(DATA_WIDTH) r_122(clk, reset, cell_1542, reg_1542);
	
	add #(DATA_WIDTH) alu_1543(tmp8, reg_1542, cell_1543); 
	register #(DATA_WIDTH) r_123(clk, reset, cell_1543, reg_1543);
	
	add #(DATA_WIDTH) alu_1544(tmp8, reg_1543, cell_1544); 
	register #(DATA_WIDTH) r_124(clk, reset, cell_1544, reg_1544);
	
	add #(DATA_WIDTH) alu_1545(tmp8, reg_1544, cell_1545); 
	register #(DATA_WIDTH) r_125(clk, reset, cell_1545, reg_1545);
	
	add #(DATA_WIDTH) alu_1546(tmp8, reg_1545, cell_1546); 
	register #(DATA_WIDTH) r_126(clk, reset, cell_1546, reg_1546);
	
	add #(DATA_WIDTH) alu_1547(tmp8, reg_1546, cell_1547); 
	register #(DATA_WIDTH) r_127(clk, reset, cell_1547, reg_1547);
  
	div #(DATA_WIDTH,32'b01000010100000000000000000000000) div0( 
	                           .in(reg_1547), 
	                           .out(tmp_out)
	                           );
	                 
assign pxl_out = tmp_out;

integer counter = 0;

reg en_valid;
reg tmp = 0;
	
always @(posedge clk) begin
		if(valid_memory)begin
	    en_valid = 1;
	    end
	  if(en_valid == 1'b1)begin
		counter <= counter + 1;
		end
		else begin
		  counter <=0;
		  end
		if (counter == W*H + 1) begin
				tmp <= 1;
				end
		else
			tmp <= 0; 
			end
			
	assign valid_out = tmp;
  

endmodule








