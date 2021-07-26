`timescale 1ns / 1ps
`define DATALENGTH 32



module tb_Softmax
#(
parameter NUMBER = 1536,
parameter I = 20,
parameter C = 10
)
(
		);
reg 						Clock;
reg 						Reset;
reg 						Valid_in;
reg [`DATALENGTH-1:0] 	Datain;

wire [`DATALENGTH-1:0] Dataout;
wire Valid_out;

reg [`DATALENGTH-1:0]In[NUMBER-1:0];
reg [`DATALENGTH-1:0]Out;
  
integer i;
	
initial begin
	Clock = 1;
	Reset = 1;
 Valid_in = 0;
	#I
	//Start = 1;
	Reset = 0;
	#I
	Valid_in = 1;
	i=0;
	//Start = 0;
  $readmemb("E:/Drive/ICDesign_Seminar/Data/input_softmax.txt", In);
  Out = $fopen("E:/Drive/ICDesign_Seminar/Result/Text/Output_Softmax.txt");
	end 

	
always @(posedge Clock) begin
    Datain = In[i];
    #(I) i = i + 1;
  if(Valid_out == 1)begin
    $fdisplay(Out,"%b",Dataout);
  end  
  if(i == (NUMBER*4)+3) begin
    $finish;
  end
end

always 
#(C) Clock = ~Clock;

Softmax #(NUMBER) DUT (Clock, Reset,Valid_in, Datain, Dataout,Valid_out);

endmodule 

