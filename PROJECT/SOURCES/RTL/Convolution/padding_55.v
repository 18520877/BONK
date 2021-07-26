module padding_55
  #(parameter D = 35,
    parameter DATA_WIDTH = 32)
    (
      //input
    	input clk,
    	input reset,
    	input en,
    	input [DATA_WIDTH-1:0] pxl_in,
			//output
   	output  [DATA_WIDTH-1:0] pxl_out,
   	output valid

    );
    //debug
    wire  [DATA_WIDTH-1:0] test_in;
    	  
    parameter W = D;
    parameter H = D;
    parameter T = W * H;
    
    integer i = 0;
    integer g = 0;
    integer j = W;
    integer x = 0;
    
    reg [DATA_WIDTH-1:0] tmp;
    reg [DATA_WIDTH-1:0]memory[T:0];
    reg tmp_valid;
    
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
    if(i < (((W+4)*(H+4))+1))begin
        if(i <= (W+4)*2 + 1)
           tmp <= 0;      
        else if(i >= ((W+4)*2+j+2) && i <= ((W+4)*2+j+4))
           tmp <= 0;
        else if(i == ((W+4)*2+j+5) && j <= (((W+4)*H) - 5))begin
           tmp <= 0;
           j <= j+W+4;
         end
        else if(i >= ( (W+4)*(H+2) ) )
           tmp <= 0;
        else begin
            tmp <= memory[x];
            x <= x + 1;
        end
    end
    
    i <= i+1;
    
  end
end
always @(posedge clk)begin
  if(en)begin
    if( i < (((W+4)*(H+4)) + 1))begin
      tmp_valid <= 1;
    end
    else 
      tmp_valid <= 0;  
  end 
  else
    tmp_valid <= 0;  
 end
  
assign valid = tmp_valid;
assign test_in = memory[x];
assign pxl_out =tmp;

endmodule










