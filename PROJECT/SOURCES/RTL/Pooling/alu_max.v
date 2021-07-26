module alu_max 
#(  
    parameter DATA_WIDTH = 8
    ) 
    (
    input [DATA_WIDTH-1:0] in,
    input reg [DATA_WIDTH-1:0] r,
    output reg [DATA_WIDTH-1:0] out
    );
    
always @ (*) begin
	if (in[DATA_WIDTH-1] == 1'b1 && r[DATA_WIDTH-1] == 1'b0) begin
		out = r;
	end 
	else if (r[DATA_WIDTH-1] == 1'b1 && in[DATA_WIDTH-1] == 1'b0) begin
		out = in;
	end
	else if (r[DATA_WIDTH-2:DATA_WIDTH-9] > in[DATA_WIDTH-2:DATA_WIDTH-9]) begin
		out = r;
	end 
	else if (in[DATA_WIDTH-2:DATA_WIDTH-9] > r[DATA_WIDTH-2:DATA_WIDTH-9]) begin
		out = in;
	end
	else if (in[DATA_WIDTH-2:DATA_WIDTH-9] == r[DATA_WIDTH-2:DATA_WIDTH-9])begin
	  if (in[DATA_WIDTH-10:0] >= r[DATA_WIDTH-10:0])begin
	    out = in;
	  end
	  else if (r[DATA_WIDTH-10:0] >= in[DATA_WIDTH-10:0])begin
	    out = r;
	  end
	end
end

endmodule

