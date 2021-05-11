module alu(
    input [7:0] in,
    input [31:0] k,
    input [15:0] r,
    output [15:0] out
    );

wire [15:0] d;
assign d = k * in;
assign out = d + r;
 
endmodule


