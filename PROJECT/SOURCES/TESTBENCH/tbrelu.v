`timescale 1ns / 1ps

module testbench;
  parameter T = 47524;
	parameter C = 10;
	parameter I = 20;
	integer i;
	
	reg clk;
	reg [15:0] din_relu;
	
	reg [15:0]In[T-1:0];
  reg [15:0]Out;
	
	wire [15:0] dout_relu;
	wire valid;

initial begin
  i=0;
	clk = 0;
  $readmemb("output_gx_33.txt", In);
  Out = $fopen("output_relu.txt");
	end 
	
	always #(C) clk = ~ clk;
	
always @(posedge clk) begin
  din_relu = In[i];
  #(I) i = i + 1;
  if(valid == 1'b1)begin
    $fdisplay(Out,"%b",dout_relu);
  end
  if(i == T+2) begin
  $finish;
end
end

	relu uut (
	   .clk(clk),
		.din_relu(din_relu),
		.dout_relu(dout_relu),
		.valid(valid)
	);

endmodule


