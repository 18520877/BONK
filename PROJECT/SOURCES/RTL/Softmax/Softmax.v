//dropout + flatten + dense
`define f2r(z) ({z[31], z[30], {3{~z[30]}}, z[29:23], z[22:0], {29{1'b0}}})
`define r2f(z) ({z[63], z[62], z[58:52], z[51:29]})
//`timescale 1ns / 1ps
module Softmax 
#(
  parameter C = 1536,
  parameter DATA_WIDTH = 32
) 
(input clk,
   input reset,
   input valid_in,
   input [31:0] pxl_in,
   output reg [31:0] pxl_out,
   output reg valid_out
);

reg s1,s2,s3,s4,s6;
wire s5[C-1:0];
real r,sum;

reg [63:0] num [C-1:0];
wire [31:0] per [C-1:0];
integer i = 0;

always @(posedge clk or negedge reset)begin
    if (reset == 1'b1) begin
        num[i] <= 0;
        s1 <=0;
    end
    else if (valid_in == 1'b1 && i < C)begin
        num[i] <= `f2r(pxl_in);
        s1 <= valid_in;
          i <= i + 1;
    end
    else begin 
        num[i] <= num[i];
        s1 <= 0;
  end
end 

integer j = 0;
reg [63:0] realm [C-1:0];
 
always @(posedge clk or negedge reset)begin
    if (reset ==1'b1) begin
        r <= 0;
         s2 <= 0;
    end
    else if (s1 == 1'b1 && j < C) begin
        r <= 2.71828182846**$bitstoreal(num[j]);
        realm[j] <= $realtobits(r);
        j <= j + 1;
        s2 <= s1;
      end
      else begin
            r <= 0;
            s2 <= 0;
        end

end

integer k = 0;

always @(posedge clk or negedge reset)begin
    if (reset == 1'b1)begin
        sum <= 0;
        s3 <= 0;
      end
        else if (s2 ==1'b1 && k < C)begin
            sum <= sum + $bitstoreal(realm[k]);
              k <= k + 1;
          end
        else if(k == C) begin
                s3 <= 1;
          end  
      else begin
            sum <= sum;
            s3 <= 0;
        end
end



reg [63:0] sumbits;
wire [31:0] sumf;

always @(posedge clk or negedge reset)begin
    if (reset == 1'b1) begin
      sumbits <= 0;
      s6 = 0;
    end
    else if (s3 ==1'b1)begin
       sumbits = $realtobits(sum);
       s6 <= s3;
  end
     else begin
            sumbits <= sumbits;
            s6 = 0;
        end
end
assign sumf = `r2f(sumbits);

reg [31:0] realmf [C-1:0];

integer m = 0;

always @(posedge clk or negedge reset)begin
    if (reset == 1'b1) begin
      realmf[m] <= 0;
      s4 <= 0;
    end
    else if (s3 ==1'b1 && m  < C)begin
       realmf[m] <= `r2f(realm[m]);
       m <= m + 1;
  end
  else if(m == C) begin
                s4 <= s3;
          end 
        else begin
            realmf[m] <= realmf[m];
            s4 <= 0;
        end
end


genvar o;
generate
for (o = 0; o <= C; o= o+1) begin  
 div_fp div_inst (realmf[o],sumf,(s4&s6),per[o],s5[o]);
end
endgenerate 
/*always @(posedge clk or negedge reset)begin
    if (reset == 1'b1) begin
    per[m] <= 0;
    //per1 <= 0;
    valid_out <= 0;
    end
    else if (s3 ==1'b1 && m < C)begin
        per[m] <=  realm[m] / sumbits;
        //per1 <= $realtobits(r1_bk/sum);
            m <= m + 1;
    end
    else begin
        per[m] <= per[m];
        //per1 <= per1;
        valid_out <=0;
    end

end*/

integer n = 0;

always @(posedge clk or negedge reset)begin
    if (reset == 1'b1) begin
      pxl_out <= 0;
      valid_out <= 0;
    end
    else if (s5[n] == 1'b1 && n  < C)begin
       pxl_out <= per[n];
       valid_out <= s5[n];
       n <= n + 1;
  end
       else begin
           pxl_out <= pxl_out;
            valid_out <= 0;
        end
end 
  wire [63:0]  numtest;
  //wire [31:0] pertest;
  wire [63:0] realmtest;
  //wire [31:0] realmftest;
  assign numtest = num[j]; 
 // assign pertest = per[n]; 
  assign realmtest = realm[m];
  //assign realmftest = realmf[o]; 
endmodule

