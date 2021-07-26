 module merge_32i
#(
  parameter D = 220,
  parameter DATA_WIDTH = 32)
(
    	input clk,
     	input reset,
     	input valid_in_1,valid_in_2,valid_in_3,valid_in_4,valid_in_5,valid_in_6,valid_in_7,valid_in_8,valid_in_9,
            valid_in_10,valid_in_11,valid_in_12,valid_in_13,valid_in_14,valid_in_15,valid_in_16,valid_in_17,valid_in_18,
            valid_in_19,valid_in_20,valid_in_21,valid_in_22,valid_in_23,valid_in_24,valid_in_25,valid_in_26,valid_in_27,
            valid_in_28,valid_in_29,valid_in_30,valid_in_31,valid_in_32,
            
      input [DATA_WIDTH-1:0] pxl_in_1,pxl_in_2,pxl_in_3,pxl_in_4,pxl_in_5,pxl_in_6,pxl_in_7,pxl_in_8,pxl_in_9,
                             pxl_in_10,pxl_in_11,pxl_in_12,pxl_in_13,pxl_in_14,pxl_in_15,pxl_in_16,pxl_in_17,pxl_in_18,
                             pxl_in_19,pxl_in_20,pxl_in_21,pxl_in_22,pxl_in_23,pxl_in_24,pxl_in_25,pxl_in_26,pxl_in_27,
                             pxl_in_28,pxl_in_29,pxl_in_30,pxl_in_31,pxl_in_32,
                             
      output [DATA_WIDTH-1:0] pxl_out,
      output valid_out
);
  parameter D_2 = (D*4);
  parameter D_3 = (D_2*4);
  
	wire [DATA_WIDTH-1:0] pxl_out_1 , pxl_out_2 , pxl_out_3 , pxl_out_4 , pxl_out_5 , pxl_out_6 , pxl_out_7 , pxl_out_8;
	
	wire valid_out_1 , valid_out_2 , valid_out_3 , valid_out_4 , valid_out_5 , valid_out_6 , valid_out_7 , valid_out_8;
	
	wire [DATA_WIDTH-1:0] tmp_pxl_out_1, tmp_pxl_out_2;
	
	wire tmp_valid_out_1, tmp_valid_out_2;
	
  merge_4i #(D,1,1,1,1,DATA_WIDTH) x1(    
                  .clk(clk),
                  .reset(reset),
                  
                  .valid_in_1(valid_in_1),
                  .valid_in_2(valid_in_2),
                  .valid_in_3(valid_in_3),
                  .valid_in_4(valid_in_4),
                  
                  .pxl_in_1(pxl_in_1),
                  .pxl_in_2(pxl_in_2),
                  .pxl_in_3(pxl_in_3),
                  .pxl_in_4(pxl_in_4),
                  
                  .pxl_out(pxl_out_1),
                  .valid_out(valid_out_1)
                  ); 
                  
merge_4i #(D,1,1,1,1,DATA_WIDTH) x2(    
                  .clk(clk),
                  .reset(reset),
                  
                  .valid_in_1(valid_in_5),
                  .valid_in_2(valid_in_6),
                  .valid_in_3(valid_in_7),
                  .valid_in_4(valid_in_8),
                  
                  .pxl_in_1(pxl_in_5),
                  .pxl_in_2(pxl_in_6),
                  .pxl_in_3(pxl_in_7),
                  .pxl_in_4(pxl_in_8),
                  
                  .pxl_out(pxl_out_2),
                  .valid_out(valid_out_2)
                  );
                  
merge_4i #(D,1,1,1,1,DATA_WIDTH) x3(    
                  .clk(clk),
                  .reset(reset),
                  
                  .valid_in_1(valid_in_9),
                  .valid_in_2(valid_in_10),
                  .valid_in_3(valid_in_11),
                  .valid_in_4(valid_in_12),
                  
                  .pxl_in_1(pxl_in_9),
                  .pxl_in_2(pxl_in_10),
                  .pxl_in_3(pxl_in_11),
                  .pxl_in_4(pxl_in_12),
                  
                  .pxl_out(pxl_out_3),
                  .valid_out(valid_out_3)
                  );
                  
merge_4i #(D,1,1,1,1,DATA_WIDTH) x4(    
                  .clk(clk),
                  .reset(reset),
                  
                  .valid_in_1(valid_in_13),
                  .valid_in_2(valid_in_14),
                  .valid_in_3(valid_in_15),
                  .valid_in_4(valid_in_16),
                  
                  .pxl_in_1(pxl_in_13),
                  .pxl_in_2(pxl_in_14),
                  .pxl_in_3(pxl_in_15),
                  .pxl_in_4(pxl_in_16),
                  
                  .pxl_out(pxl_out_4),
                  .valid_out(valid_out_4)
                  );
                  
merge_4i #(D,1,1,1,1,DATA_WIDTH) x5(    
                  .clk(clk),
                  .reset(reset),
                  
                  .valid_in_1(valid_in_17),
                  .valid_in_2(valid_in_18),
                  .valid_in_3(valid_in_19),
                  .valid_in_4(valid_in_20),
                  
                  .pxl_in_1(pxl_in_17),
                  .pxl_in_2(pxl_in_18),
                  .pxl_in_3(pxl_in_19),
                  .pxl_in_4(pxl_in_20),
                  
                  .pxl_out(pxl_out_5),
                  .valid_out(valid_out_5)
                  );
                  
merge_4i #(D,1,1,1,1,DATA_WIDTH) x6(    
                  .clk(clk),
                  .reset(reset),
                  
                  .valid_in_1(valid_in_21),
                  .valid_in_2(valid_in_22),
                  .valid_in_3(valid_in_23),
                  .valid_in_4(valid_in_24),
                  
                  .pxl_in_1(pxl_in_21),
                  .pxl_in_2(pxl_in_22),
                  .pxl_in_3(pxl_in_23),
                  .pxl_in_4(pxl_in_24),
                  
                  .pxl_out(pxl_out_6),
                  .valid_out(valid_out_6)
                  );
                  
merge_4i #(D,1,1,1,1,DATA_WIDTH) x7(    
                  .clk(clk),
                  .reset(reset),
                  
                  .valid_in_1(valid_in_25),
                  .valid_in_2(valid_in_26),
                  .valid_in_3(valid_in_27),
                  .valid_in_4(valid_in_28),
                  
                  .pxl_in_1(pxl_in_25),
                  .pxl_in_2(pxl_in_26),
                  .pxl_in_3(pxl_in_27),
                  .pxl_in_4(pxl_in_28),
                  
                  .pxl_out(pxl_out_7),
                  .valid_out(valid_out_7)
                  );
                  
merge_4i #(D,1,1,1,1,DATA_WIDTH) x8(    
                  .clk(clk),
                  .reset(reset),
                  
                  .valid_in_1(valid_in_29),
                  .valid_in_2(valid_in_30),
                  .valid_in_3(valid_in_31),
                  .valid_in_4(valid_in_32),
                  
                  .pxl_in_1(pxl_in_29),
                  .pxl_in_2(pxl_in_30),
                  .pxl_in_3(pxl_in_31),
                  .pxl_in_4(pxl_in_32),
                  
                  .pxl_out(pxl_out_8),
                  .valid_out(valid_out_8)
                  );
                  
  merge_4i #(D,4,4,4,4,DATA_WIDTH) y1(    
                  .clk(clk),
                  .reset(reset),
                  
                  .valid_in_1(valid_out_1),
                  .valid_in_2(valid_out_2),
                  .valid_in_3(valid_out_3),
                  .valid_in_4(valid_out_4),
                  
                  .pxl_in_1(pxl_out_1),
                  .pxl_in_2(pxl_out_2),
                  .pxl_in_3(pxl_out_3),
                  .pxl_in_4(pxl_out_4),
                  
                  .pxl_out(tmp_pxl_out_1),
                  .valid_out(tmp_valid_out_1)
                  ); 
                  
merge_4i #(D,4,4,4,4,DATA_WIDTH) y2(    
                  .clk(clk),
                  .reset(reset),
                  
                  .valid_in_1(valid_out_5),
                  .valid_in_2(valid_out_6),
                  .valid_in_3(valid_out_7),
                  .valid_in_4(valid_out_8),
                  
                  .pxl_in_1(pxl_out_5),
                  .pxl_in_2(pxl_out_6),
                  .pxl_in_3(pxl_out_7),
                  .pxl_in_4(pxl_out_8),
                  
                  .pxl_out(tmp_pxl_out_2),
                  .valid_out(tmp_valid_out_2)
                  );
                  
  merge_2i #(D,16,16,DATA_WIDTH) z(    
                  .clk(clk),
                  .reset(reset),
                  
                  .valid_in_1(tmp_valid_out_1),
                  .valid_in_2(tmp_valid_out_2),
                  
                  .pxl_in_1(tmp_pxl_out_1),
                  .pxl_in_2(tmp_pxl_out_2),
                  
                  .pxl_out(pxl_out),
                  .valid_out(valid_out)
                  ); 
                  
endmodule                                                       