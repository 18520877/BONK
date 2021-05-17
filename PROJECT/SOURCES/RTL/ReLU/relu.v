module relu(
    input clk,
    input [15:0] din_relu,
    output reg [15:0] dout_relu,
    output reg valid
    );
    always @(posedge clk) begin
       dout_relu = (din_relu[15] == 0)? din_relu : 0;
       if(dout_relu >= 0)begin
          valid = 1'b1;
        end
       else begin
          valid = 1'b0;
       end
    end 
    //if the sign bit is high, send zero on the output else send the input
endmodule

