module add 
#(
  parameter DATA_WIDTH = 32
  ) 
  (
    //input clk,
    input [DATA_WIDTH-1:0] in,
    input [DATA_WIDTH-1:0] r,
    output reg [DATA_WIDTH-1:0] out
    );
    
reg [DATA_WIDTH-1:0] tmp_in;
reg [DATA_WIDTH-1:0] tmp_r;
wire [DATA_WIDTH-1:0] out_add;
wire [DATA_WIDTH-1:0] out_sub;
 reg [DATA_WIDTH-1:0] tmp;
   
 always @(*) begin
  if(in[DATA_WIDTH-1] ^ r[DATA_WIDTH-1] == 1'b0)begin
    tmp_in = in;
    tmp_r = r;
  end
  else if(in[DATA_WIDTH-1])begin
    tmp_r = {1'b0,in[DATA_WIDTH-2:0]};
     tmp_in = r;
  end
  else begin
    tmp_in = in;
    tmp_r = {1'b0,r[DATA_WIDTH-2:0]};
  end
 end 
   
add_fp_single add_fp_inst (  .a(tmp_in),
                      .b(tmp_r),
                      .out(out_add)
                      );
                      
sub_fp_single sub_fp_inst (  .a(tmp_in),
                      .b(tmp_r),
                      .out(out_sub)
                      );
                      
 always @(*) begin
  if(in[DATA_WIDTH-1] ^ r[DATA_WIDTH-1] == 1'b0)begin
    tmp = out_add;
  end
  else begin
    tmp = out_sub;
  end
 end 
 
  always @(*)begin
  if(in >=  0 && r >=0)begin
    out <= tmp;
  end
  else if(in <  0 && r < 0)begin
    out <= tmp;
  end
end  
endmodule






