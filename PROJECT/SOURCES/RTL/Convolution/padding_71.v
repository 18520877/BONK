module padding_71
  #(parameter D = 220,
    parameter DATA_WIDTH = 32)
    (
    	input clk,
    	input reset,
    	input en,
    	input [DATA_WIDTH-1:0] pxl_in,
			//debug
   	output  [DATA_WIDTH-1:0] pxl_out,
   	output  valid
    );
        //debug
    wire  [DATA_WIDTH-1:0] test_in;
    
    parameter W = D;
    parameter H = D;
    parameter T = W * H;
    
    integer i = 0;
    integer g = 0;
    integer x = 0;
    
    reg [DATA_WIDTH-1:0] tmp;
    reg [DATA_WIDTH-1:0]memory[T:0];
    
always @(posedge clk, posedge reset)begin
  if(reset)begin
    tmp <= 0; 
  end
end 
  
always @(posedge clk)begin
  if(en)begin
    memory[g] <= pxl_in;
    g <= g+1;
  end
end

always @(posedge clk)begin
  if(en)begin
    if(i < ((W+6)*H))begin
        if(i < W*3)
           tmp <= 0;      
        else if( x >= (W*H))
           tmp <= 0;
        else begin
            tmp <= memory[x];
            x <= x + 1;
        end
    end
    i <= i+1;
  end
end

reg tmp1;

always @(posedge clk)begin
  if(en)begin
    if(i < ((W+6)*H))begin
      tmp1 <= 1;
    end
    else 
      tmp1 <= 0;  
  end 
  else
    tmp1 <= 0;  
 end
 
assign valid = tmp1;
assign test_in = memory[x];
assign pxl_out =tmp;


endmodule






















