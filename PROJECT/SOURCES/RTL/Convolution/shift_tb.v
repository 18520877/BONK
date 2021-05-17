module shift_tb;
  parameter D = 3;
  reg clk;
  reg [15:0] data_in;
  wire [15:0] data_out;
   wire [D-1:0] hr_0; wire [D-1:0] hr_1; wire [D-1:0] hr_2; wire [D-1:0] hr_3;
 wire [D-1:0] hr_4; wire [D-1:0] hr_5; wire [D-1:0] hr_6; wire [D-1:0] hr_7;
 wire [D-1:0] hr_8; wire [D-1:0] hr_9; wire [D-1:0] hr_10; wire [D-1:0] hr_11;
 wire [D-1:0] hr_12; wire [D-1:0] hr_13; wire [D-1:0] hr_14; wire [D-1:0] hr_15;

  shift uut(
	.clk(clk),
	.data_in(data_in),
	.data_out(data_out),
	.hr_0(hr_0),
	.hr_1(hr_1),
	.hr_2(hr_2),
	.hr_3(hr_3),
	.hr_4(hr_4),
	.hr_5(hr_5),
	.hr_6(hr_6),
	.hr_7(hr_7),
	.hr_8(hr_8),
	.hr_9(hr_9),
	.hr_10(hr_10),
	.hr_11(hr_11),
	.hr_12(hr_12),
	.hr_13(hr_13),
	.hr_14(hr_14),
	.hr_15(hr_15)
	);
  
  initial begin
    	clk = 0;
    	data_in = 100;
    
    	#100;
		
    	data_in = 10;
	#40;
	
    	data_in = 30;
	#40;
	
    	data_in = 21;
	#40;

	data_in = 110;
	#40;
	
    end
	
    always #10 clk = ~ clk;
      
endmodule
