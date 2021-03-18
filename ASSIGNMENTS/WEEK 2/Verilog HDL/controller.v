module controller(clk,reset,i2pEn,mulEn,addEn,f2iEn);
  input clk,reset;
  output reg i2pEn,mulEn,addEn,f2iEn;
  
  reg mulEn_s0,addEn_s0,f2iEn_s0;
always @(posedge clk or posedge reset) begin
  if(reset) begin
    i2pEn <= 1'b0;
    mulEn_s0 <= 1'b0;
    addEn_s0 <= 1'b0;
    f2iEn_s0 <= 1'b0;
  end
  else begin
    i2pEn <= 1'b1;
    mulEn_s0 <= 1'b1;
    addEn_s0 <= 1'b1;
    f2iEn_s0 <= 1'b1;      
  end
end

  reg addEn_s1,f2iEn_s1;
always @(posedge clk or posedge reset) begin
  if(reset) begin
    mulEn <= 1'b0;
    addEn_s1 <= 1'b0;
    f2iEn_s1 <= 1'b0;
  end
  else begin
    mulEn <= mulEn_s0;
    addEn_s1 <= addEn_s0;
    f2iEn_s1 <= f2iEn_s0;      
  end
end

  reg f2iEn_s2;
always @(posedge clk or posedge reset) begin
  if(reset) begin
    addEn <= 1'b0;
    f2iEn_s2 <= 1'b0;
  end
  else begin
    addEn <= addEn_s1;
    f2iEn_s2 <= f2iEn_s1;      
  end
end

always @(posedge clk or posedge reset) begin
  if(reset) begin
    f2iEn <= 1'b0;
  end
  else begin
    f2iEn <= f2iEn_s2;      
  end
end
endmodule