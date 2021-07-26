module alu
#(
  parameter DATA_WIDTH = 32
)
    (
    input [DATA_WIDTH-1:0] in,
    input [DATA_WIDTH-1:0] k,
    input [DATA_WIDTH-1:0] r,
    output reg [DATA_WIDTH-1:0] out
    );


 wire [DATA_WIDTH-1:0] d;
 wire [DATA_WIDTH-1:0] tmp;  
 //assign d = in * k;
 //assign out = d + r; 
  
mul_fp_single mul_fp_inst (  .a(in),
                      .b(k),
                      .out(d)
                      );
                       
add add_fp_inst (  .in(d),
                      .r(r),
                      .out(tmp)
                      );
 always @(*)begin
  if(in >=  0 && k >= 0 && r >=0)begin
    out <= tmp;
  end
  else if(in <  0 && k < 0 && r < 0)begin
    out <= tmp;
  end
end                      
endmodule






