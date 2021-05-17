module register(clk, reset, in, out);
  input clk,reset;
  input [15:0] in;
  output reg [15:0] out;
  
  always @(posedge clk)begin
    if(reset)begin
      out <= 0;
    end
  else begin
    out <= in;
  end
end
endmodule
