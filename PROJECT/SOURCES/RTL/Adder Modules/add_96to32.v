// add 3 input to 1 input
// 149x149x96 -> 149x149x32

 module add_96to32
#(
  parameter D = 220,
  parameter DATA_WIDTH = 32)
(
    	input clk,
     	input reset,
     	input valid_in_1,valid_in_2,valid_in_3,valid_in_4,valid_in_5,valid_in_6,valid_in_7,valid_in_8,valid_in_9,
valid_in_10,valid_in_11,valid_in_12,valid_in_13,valid_in_14,valid_in_15,valid_in_16,valid_in_17,valid_in_18,
valid_in_19,valid_in_20,valid_in_21,valid_in_22,valid_in_23,valid_in_24,valid_in_25,valid_in_26,valid_in_27,
valid_in_28,valid_in_29,valid_in_30,valid_in_31,valid_in_32,valid_in_33,valid_in_34,valid_in_35,valid_in_36,
valid_in_37,valid_in_38,valid_in_39,valid_in_40,valid_in_41,valid_in_42,valid_in_43,valid_in_44,valid_in_45,
valid_in_46,valid_in_47,valid_in_48,valid_in_49,valid_in_50,valid_in_51,valid_in_52,valid_in_53,valid_in_54,
valid_in_55,valid_in_56,valid_in_57,valid_in_58,valid_in_59,valid_in_60,valid_in_61,valid_in_62,valid_in_63,
valid_in_64,valid_in_65,valid_in_66,valid_in_67,valid_in_68,valid_in_69,valid_in_70,valid_in_71,valid_in_72,
valid_in_73,valid_in_74,valid_in_75,valid_in_76,valid_in_77,valid_in_78,valid_in_79,valid_in_80,valid_in_81,
valid_in_82,valid_in_83,valid_in_84,valid_in_85,valid_in_86,valid_in_87,valid_in_88,valid_in_89,valid_in_90,
valid_in_91,valid_in_92,valid_in_93,valid_in_94,valid_in_95,valid_in_96,
    	      
    	input [DATA_WIDTH-1:0] pxl_in_1,pxl_in_2,pxl_in_3,pxl_in_4,pxl_in_5,pxl_in_6,pxl_in_7,pxl_in_8,pxl_in_9,
pxl_in_10,pxl_in_11,pxl_in_12,pxl_in_13,pxl_in_14,pxl_in_15,pxl_in_16,pxl_in_17,pxl_in_18,
pxl_in_19,pxl_in_20,pxl_in_21,pxl_in_22,pxl_in_23,pxl_in_24,pxl_in_25,pxl_in_26,pxl_in_27,
pxl_in_28,pxl_in_29,pxl_in_30,pxl_in_31,pxl_in_32,pxl_in_33,pxl_in_34,pxl_in_35,pxl_in_36,
pxl_in_37,pxl_in_38,pxl_in_39,pxl_in_40,pxl_in_41,pxl_in_42,pxl_in_43,pxl_in_44,pxl_in_45,
pxl_in_46,pxl_in_47,pxl_in_48,pxl_in_49,pxl_in_50,pxl_in_51,pxl_in_52,pxl_in_53,pxl_in_54,
pxl_in_55,pxl_in_56,pxl_in_57,pxl_in_58,pxl_in_59,pxl_in_60,pxl_in_61,pxl_in_62,pxl_in_63,
pxl_in_64,pxl_in_65,pxl_in_66,pxl_in_67,pxl_in_68,pxl_in_69,pxl_in_70,pxl_in_71,pxl_in_72,
pxl_in_73,pxl_in_74,pxl_in_75,pxl_in_76,pxl_in_77,pxl_in_78,pxl_in_79,pxl_in_80,pxl_in_81,
pxl_in_82,pxl_in_83,pxl_in_84,pxl_in_85,pxl_in_86,pxl_in_87,pxl_in_88,pxl_in_89,pxl_in_90,
pxl_in_91,pxl_in_92,pxl_in_93,pxl_in_94,pxl_in_95,pxl_in_96,
  	     	
    	output [DATA_WIDTH-1:0] pxl_out_1 , pxl_out_2 , pxl_out_3 , pxl_out_4 , pxl_out_5 , pxl_out_6 , pxl_out_7 , pxl_out_8 , pxl_out_9 , pxl_out_10,
                        pxl_out_11, pxl_out_12, pxl_out_13, pxl_out_14, pxl_out_15, pxl_out_16, pxl_out_17, pxl_out_18, pxl_out_19, pxl_out_20,
	                      pxl_out_21, pxl_out_22, pxl_out_23, pxl_out_24, pxl_out_25, pxl_out_26, pxl_out_27, pxl_out_28, pxl_out_29, pxl_out_30,
                        pxl_out_31, pxl_out_32,
	                                 
	               output valid_out_1 , valid_out_2 , valid_out_3 , valid_out_4 , valid_out_5 , valid_out_6 , valid_out_7 , valid_out_8 , valid_out_9 , valid_out_10,
                        valid_out_11, valid_out_12, valid_out_13, valid_out_14, valid_out_15, valid_out_16, valid_out_17, valid_out_18, valid_out_19, valid_out_20,
	                      valid_out_21, valid_out_22, valid_out_23, valid_out_24, valid_out_25, valid_out_26, valid_out_27, valid_out_28, valid_out_29, valid_out_30,
                        valid_out_31, valid_out_32
	 );

add_3layers #(D, DATA_WIDTH) uut11(.clk(clk), .reset(reset),
.valid_in_1(valid_in_1),
.valid_in_2(valid_in_2),
.valid_in_3(valid_in_3),
.pxl_in_1(pxl_in_1),
.pxl_in_2(pxl_in_2),
.pxl_in_3(pxl_in_3),
.pxl_out(pxl_out_1),
.valid_out(valid_out_1) );

add_3layers #(D, DATA_WIDTH) uut12(.clk(clk), .reset(reset),
.valid_in_1(valid_in_4),
.valid_in_2(valid_in_5),
.valid_in_3(valid_in_6),
.pxl_in_1(pxl_in_4),
.pxl_in_2(pxl_in_5),
.pxl_in_3(pxl_in_6),
.pxl_out(pxl_out_2),
.valid_out(valid_out_2) );

add_3layers #(D, DATA_WIDTH) uut13(.clk(clk), .reset(reset),
.valid_in_1(valid_in_7),
.valid_in_2(valid_in_8),
.valid_in_3(valid_in_9),
.pxl_in_1(pxl_in_7),
.pxl_in_2(pxl_in_8),
.pxl_in_3(pxl_in_9),
.pxl_out(pxl_out_3),
.valid_out(valid_out_3) );

add_3layers #(D, DATA_WIDTH) uut14(.clk(clk), .reset(reset),
.valid_in_1(valid_in_10),
.valid_in_2(valid_in_11),
.valid_in_3(valid_in_12),
.pxl_in_1(pxl_in_10),
.pxl_in_2(pxl_in_11),
.pxl_in_3(pxl_in_12),
.pxl_out(pxl_out_4),
.valid_out(valid_out_4) );

add_3layers #(D, DATA_WIDTH) uut15(.clk(clk), .reset(reset),
.valid_in_1(valid_in_13),
.valid_in_2(valid_in_14),
.valid_in_3(valid_in_15),
.pxl_in_1(pxl_in_13),
.pxl_in_2(pxl_in_14),
.pxl_in_3(pxl_in_15),
.pxl_out(pxl_out_5),
.valid_out(valid_out_5) );

add_3layers #(D, DATA_WIDTH) uut16(.clk(clk), .reset(reset),
.valid_in_1(valid_in_16),
.valid_in_2(valid_in_17),
.valid_in_3(valid_in_18),
.pxl_in_1(pxl_in_16),
.pxl_in_2(pxl_in_17),
.pxl_in_3(pxl_in_18),
.pxl_out(pxl_out_6),
.valid_out(valid_out_6) );

add_3layers #(D, DATA_WIDTH) uut17(.clk(clk), .reset(reset),
.valid_in_1(valid_in_19),
.valid_in_2(valid_in_20),
.valid_in_3(valid_in_21),
.pxl_in_1(pxl_in_19),
.pxl_in_2(pxl_in_20),
.pxl_in_3(pxl_in_21),
.pxl_out(pxl_out_7),
.valid_out(valid_out_7) );

add_3layers #(D, DATA_WIDTH) uut18(.clk(clk), .reset(reset),
.valid_in_1(valid_in_22),
.valid_in_2(valid_in_23),
.valid_in_3(valid_in_24),
.pxl_in_1(pxl_in_22),
.pxl_in_2(pxl_in_23),
.pxl_in_3(pxl_in_24),
.pxl_out(pxl_out_8),
.valid_out(valid_out_8) );

add_3layers #(D, DATA_WIDTH) uut19(.clk(clk), .reset(reset),
.valid_in_1(valid_in_25),
.valid_in_2(valid_in_26),
.valid_in_3(valid_in_27),
.pxl_in_1(pxl_in_25),
.pxl_in_2(pxl_in_26),
.pxl_in_3(pxl_in_27),
.pxl_out(pxl_out_9),
.valid_out(valid_out_9) );

add_3layers #(D, DATA_WIDTH) uut110(.clk(clk), .reset(reset),
.valid_in_1(valid_in_28),
.valid_in_2(valid_in_29),
.valid_in_3(valid_in_30),
.pxl_in_1(pxl_in_28),
.pxl_in_2(pxl_in_29),
.pxl_in_3(pxl_in_30),
.pxl_out(pxl_out_10),
.valid_out(valid_out_10) );

add_3layers #(D, DATA_WIDTH) uut111(.clk(clk), .reset(reset),
.valid_in_1(valid_in_31),
.valid_in_2(valid_in_32),
.valid_in_3(valid_in_33),
.pxl_in_1(pxl_in_31),
.pxl_in_2(pxl_in_32),
.pxl_in_3(pxl_in_33),
.pxl_out(pxl_out_11),
.valid_out(valid_out_11) );

add_3layers #(D, DATA_WIDTH) uut112(.clk(clk), .reset(reset),
.valid_in_1(valid_in_34),
.valid_in_2(valid_in_35),
.valid_in_3(valid_in_36),
.pxl_in_1(pxl_in_34),
.pxl_in_2(pxl_in_35),
.pxl_in_3(pxl_in_36),
.pxl_out(pxl_out_12),
.valid_out(valid_out_12) );

add_3layers #(D, DATA_WIDTH) uut113(.clk(clk), .reset(reset),
.valid_in_1(valid_in_37),
.valid_in_2(valid_in_38),
.valid_in_3(valid_in_39),
.pxl_in_1(pxl_in_37),
.pxl_in_2(pxl_in_38),
.pxl_in_3(pxl_in_39),
.pxl_out(pxl_out_13),
.valid_out(valid_out_13) );

add_3layers #(D, DATA_WIDTH) uut114(.clk(clk), .reset(reset),
.valid_in_1(valid_in_40),
.valid_in_2(valid_in_41),
.valid_in_3(valid_in_42),
.pxl_in_1(pxl_in_40),
.pxl_in_2(pxl_in_41),
.pxl_in_3(pxl_in_42),
.pxl_out(pxl_out_14),
.valid_out(valid_out_14) );

add_3layers #(D, DATA_WIDTH) uut115(.clk(clk), .reset(reset),
.valid_in_1(valid_in_43),
.valid_in_2(valid_in_44),
.valid_in_3(valid_in_45),
.pxl_in_1(pxl_in_43),
.pxl_in_2(pxl_in_44),
.pxl_in_3(pxl_in_45),
.pxl_out(pxl_out_15),
.valid_out(valid_out_15) );

add_3layers #(D, DATA_WIDTH) uut116(.clk(clk), .reset(reset),
.valid_in_1(valid_in_46),
.valid_in_2(valid_in_47),
.valid_in_3(valid_in_48),
.pxl_in_1(pxl_in_46),
.pxl_in_2(pxl_in_47),
.pxl_in_3(pxl_in_48),
.pxl_out(pxl_out_16),
.valid_out(valid_out_16) );

add_3layers #(D, DATA_WIDTH) uut117(.clk(clk), .reset(reset),
.valid_in_1(valid_in_49),
.valid_in_2(valid_in_50),
.valid_in_3(valid_in_51),
.pxl_in_1(pxl_in_49),
.pxl_in_2(pxl_in_50),
.pxl_in_3(pxl_in_51),
.pxl_out(pxl_out_17),
.valid_out(valid_out_17) );

add_3layers #(D, DATA_WIDTH) uut118(.clk(clk), .reset(reset),
.valid_in_1(valid_in_52),
.valid_in_2(valid_in_53),
.valid_in_3(valid_in_54),
.pxl_in_1(pxl_in_52),
.pxl_in_2(pxl_in_53),
.pxl_in_3(pxl_in_54),
.pxl_out(pxl_out_18),
.valid_out(valid_out_18) );

add_3layers #(D, DATA_WIDTH) uut119(.clk(clk), .reset(reset),
.valid_in_1(valid_in_55),
.valid_in_2(valid_in_56),
.valid_in_3(valid_in_57),
.pxl_in_1(pxl_in_55),
.pxl_in_2(pxl_in_56),
.pxl_in_3(pxl_in_57),
.pxl_out(pxl_out_19),
.valid_out(valid_out_19) );

add_3layers #(D, DATA_WIDTH) uut120(.clk(clk), .reset(reset),
.valid_in_1(valid_in_58),
.valid_in_2(valid_in_59),
.valid_in_3(valid_in_60),
.pxl_in_1(pxl_in_58),
.pxl_in_2(pxl_in_59),
.pxl_in_3(pxl_in_60),
.pxl_out(pxl_out_20),
.valid_out(valid_out_20) );

add_3layers #(D, DATA_WIDTH) uut121(.clk(clk), .reset(reset),
.valid_in_1(valid_in_61),
.valid_in_2(valid_in_62),
.valid_in_3(valid_in_63),
.pxl_in_1(pxl_in_61),
.pxl_in_2(pxl_in_62),
.pxl_in_3(pxl_in_63),
.pxl_out(pxl_out_21),
.valid_out(valid_out_21) );

add_3layers #(D, DATA_WIDTH) uut122(.clk(clk), .reset(reset),
.valid_in_1(valid_in_64),
.valid_in_2(valid_in_65),
.valid_in_3(valid_in_66),
.pxl_in_1(pxl_in_64),
.pxl_in_2(pxl_in_65),
.pxl_in_3(pxl_in_66),
.pxl_out(pxl_out_22),
.valid_out(valid_out_22) );

add_3layers #(D, DATA_WIDTH) uut123(.clk(clk), .reset(reset),
.valid_in_1(valid_in_67),
.valid_in_2(valid_in_68),
.valid_in_3(valid_in_69),
.pxl_in_1(pxl_in_67),
.pxl_in_2(pxl_in_68),
.pxl_in_3(pxl_in_69),
.pxl_out(pxl_out_23),
.valid_out(valid_out_23) );

add_3layers #(D, DATA_WIDTH) uut124(.clk(clk), .reset(reset),
.valid_in_1(valid_in_70),
.valid_in_2(valid_in_71),
.valid_in_3(valid_in_72),
.pxl_in_1(pxl_in_70),
.pxl_in_2(pxl_in_71),
.pxl_in_3(pxl_in_72),
.pxl_out(pxl_out_24),
.valid_out(valid_out_24) );

add_3layers #(D, DATA_WIDTH) uut125(.clk(clk), .reset(reset),
.valid_in_1(valid_in_73),
.valid_in_2(valid_in_74),
.valid_in_3(valid_in_75),
.pxl_in_1(pxl_in_73),
.pxl_in_2(pxl_in_74),
.pxl_in_3(pxl_in_75),
.pxl_out(pxl_out_25),
.valid_out(valid_out_25) );

add_3layers #(D, DATA_WIDTH) uut126(.clk(clk), .reset(reset),
.valid_in_1(valid_in_76),
.valid_in_2(valid_in_77),
.valid_in_3(valid_in_78),
.pxl_in_1(pxl_in_76),
.pxl_in_2(pxl_in_77),
.pxl_in_3(pxl_in_78),
.pxl_out(pxl_out_26),
.valid_out(valid_out_26) );

add_3layers #(D, DATA_WIDTH) uut127(.clk(clk), .reset(reset),
.valid_in_1(valid_in_79),
.valid_in_2(valid_in_80),
.valid_in_3(valid_in_81),
.pxl_in_1(pxl_in_79),
.pxl_in_2(pxl_in_80),
.pxl_in_3(pxl_in_81),
.pxl_out(pxl_out_27),
.valid_out(valid_out_27) );

add_3layers #(D, DATA_WIDTH) uut128(.clk(clk), .reset(reset),
.valid_in_1(valid_in_82),
.valid_in_2(valid_in_83),
.valid_in_3(valid_in_84),
.pxl_in_1(pxl_in_82),
.pxl_in_2(pxl_in_83),
.pxl_in_3(pxl_in_84),
.pxl_out(pxl_out_28),
.valid_out(valid_out_28) );

add_3layers #(D, DATA_WIDTH) uut129(.clk(clk), .reset(reset),
.valid_in_1(valid_in_85),
.valid_in_2(valid_in_86),
.valid_in_3(valid_in_87),
.pxl_in_1(pxl_in_85),
.pxl_in_2(pxl_in_86),
.pxl_in_3(pxl_in_87),
.pxl_out(pxl_out_29),
.valid_out(valid_out_29) );

add_3layers #(D, DATA_WIDTH) uut130(.clk(clk), .reset(reset),
.valid_in_1(valid_in_88),
.valid_in_2(valid_in_89),
.valid_in_3(valid_in_90),
.pxl_in_1(pxl_in_88),
.pxl_in_2(pxl_in_89),
.pxl_in_3(pxl_in_90),
.pxl_out(pxl_out_30),
.valid_out(valid_out_30) );

add_3layers #(D, DATA_WIDTH) uut131(.clk(clk), .reset(reset),
.valid_in_1(valid_in_91),
.valid_in_2(valid_in_92),
.valid_in_3(valid_in_93),
.pxl_in_1(pxl_in_91),
.pxl_in_2(pxl_in_92),
.pxl_in_3(pxl_in_93),
.pxl_out(pxl_out_31),
.valid_out(valid_out_31) );

add_3layers #(D, DATA_WIDTH) uut132(.clk(clk), .reset(reset),
.valid_in_1(valid_in_94),
.valid_in_2(valid_in_95),
.valid_in_3(valid_in_96),
.pxl_in_1(pxl_in_94),
.pxl_in_2(pxl_in_95),
.pxl_in_3(pxl_in_96),
.pxl_out(pxl_out_32),
.valid_out(valid_out_32) );



endmodule