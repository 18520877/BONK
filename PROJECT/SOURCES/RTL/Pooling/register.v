module register 
#( parameter DATA_WIDTH = 8) 
(clk, reset, in, out);

  input clk,reset;
  input [DATA_WIDTH-1:0] in;
  
  output reg [DATA_WIDTH-1:0] out;
  
  always @(posedge clk, posedge reset)begin
    if(reset)begin
      out <= 0;
    end
  else begin
    out <= in;
  end
end
endmodule


