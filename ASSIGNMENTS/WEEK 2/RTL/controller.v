module controller(clk,reset,invalid,i2pEn,mulEn,addEn,f2iEn,outvalid);
  input clk,reset,invalid;
  output reg i2pEn,mulEn,addEn,f2iEn,outvalid;
  
   parameter S0 = 5'b00000;
   parameter S1 = 5'b00001;
   parameter S2 = 5'b00010;
   parameter S3 = 5'b00011;
   parameter S4 = 5'b00100;
   parameter S5 = 5'b00101;
   parameter S6 = 5'b00110;
   parameter S7 = 5'b00111;
   parameter S8 = 5'b01000;
   parameter S9 = 5'b01001;
   parameter S10 = 5'b01010;
   parameter S11 = 5'b01011;
   parameter S12 = 5'b01100;
	parameter S13 = 5'b01101;
	parameter S14 = 5'b01110;
	parameter S15 = 5'b01111;
	parameter S16 = 5'b10000;
	parameter S17 = 5'b10001;
	parameter S18 = 5'b10010;
	
	reg [4:0] Next_State;
  always @(posedge clk) begin
      case (Next_State)
         S0: begin
            if (reset) begin
               Next_State <= S0;
            end
            else if(invalid) begin
               Next_State <= S1;
            end
				else begin
               Next_State <= S0;
            end
         end
         S1: begin
            if (!reset) begin
               Next_State <= S2;
            end
            else begin
               Next_State <= S0;
            end
         end
         S2: begin
            if (!reset) begin
               Next_State <= S3;
            end
            else begin
               Next_State <= S0;
            end
         end
         S3: begin
            if (!reset) begin
               Next_State <= S4;
            end
            else begin
               Next_State <= S0;
            end
         end
         S4: begin
            if (!reset) begin
               Next_State <= S5;
            end
            else begin
               Next_State <= S0;
            end
         end
         S5: begin
            if (!reset) begin
               Next_State <= S6;
            end
            else begin
               Next_State <= S0;
            end
         end
         S6:begin
            if (!reset) begin
               Next_State <= S7;
            end
            else begin
               Next_State <= S0;
            end
         end
         S7: begin
            if (!reset) begin
               Next_State <= S8;
            end
            else begin
               Next_State <= S0;
            end
         end
         S8:begin
            if (!reset) begin
               Next_State <= S9;
            end
            else begin
               Next_State <= S0;
            end
         end
         S9:begin
            if (!reset) begin
               Next_State <= S10;
            end
            else begin
               Next_State <= S0;
            end
         end
         S10:begin
            if (!reset) begin
               Next_State <= S11;
            end
            else begin
               Next_State <= S0;
            end
         end
			S11:begin
            if (!reset) begin
               Next_State <= S12;
            end
            else begin
               Next_State <= S0;
            end
         end
			S12:begin
            if (!reset) begin
               Next_State <= S13;
            end
            else begin
               Next_State <= S0;
            end
         end
			S13:begin
            if (!reset) begin
               Next_State <= S14;
            end
            else begin
               Next_State <= S0;
            end
         end
			S14:begin
            if (!reset) begin
               Next_State <= S15;
            end
            else begin
               Next_State <= S0;
            end
         end
			S15:begin
            if (!reset) begin
               Next_State <= S16;
            end
            else begin
               Next_State <= S0;
            end
         end
			S16:begin
            if (!reset) begin
               Next_State <= S17;
            end
            else begin
               Next_State <= S0;
            end
         end
			S17:begin
            if (!reset) begin
               Next_State <= S18;
            end
            else begin
               Next_State <= S0;
            end
         end
         default: Next_State <= S0;
      endcase
   end
	
	always @(Next_State) begin
      case (Next_State)
         S0: begin /*i2pEn,mulEn,addEn,f2iEn,outvalid*/
            i2pEn  		<=0;
            mulEn 		<=0;
            addEn    	<=0;
            f2iEn  		<=0;
            outvalid    <=0;
         end
         S1: begin
             i2pEn  		<=1;
            mulEn 		<=0;
            addEn    	<=0;
            f2iEn  		<=0;
            outvalid    <=0;
         end
         S2: begin
             i2pEn  		<=1;
            mulEn 		<=0;
            addEn    	<=0;
            f2iEn  		<=0;
            outvalid    <=0;
         end
         S3: begin
             i2pEn  		<=1;
            mulEn 		<=1;
            addEn    	<=0;
            f2iEn  		<=0;
            outvalid    <=0;
         end
         S4: begin
             i2pEn  		<=1;
            mulEn 		<=1;
            addEn    	<=0;
            f2iEn  		<=0;
            outvalid    <=0;
         end
         S5:begin
             i2pEn  		<=1;
            mulEn 		<=1;
            addEn    	<=0;
            f2iEn  		<=0;
            outvalid    <=0;
         end
         S6: begin
             i2pEn  		<=1;
            mulEn 		<=1;
            addEn    	<=1;
            f2iEn  		<=0;
            outvalid    <=0;
         end
         S7: begin
             i2pEn  		<=1;
            mulEn 		<=1;
            addEn    	<=1;
            f2iEn  		<=0;
            outvalid    <=0;
         end
         S8: begin
             i2pEn  		<=1;
            mulEn 		<=1;
            addEn    	<=1;
            f2iEn  		<=0;
            outvalid    <=0;
         end
         S9: begin
             i2pEn  		<=1;
            mulEn 		<=1;
            addEn    	<=1;
            f2iEn  		<=0;
            outvalid    <=0;
         end
         S10: begin
             i2pEn  		<=1;
            mulEn 		<=1;
            addEn    	<=1;
            f2iEn  		<=0;
            outvalid    <=0;
         end
         S11: begin
             i2pEn  		<=1;
            mulEn 		<=1;
            addEn    	<=1;
            f2iEn  		<=0;
            outvalid    <=0;
         end
			S12: begin
             i2pEn  		<=1;
            mulEn 		<=1;
            addEn    	<=1;
            f2iEn  		<=0;
            outvalid    <=0;
         end
			S13: begin
             i2pEn  		<=1;
            mulEn 		<=1;
            addEn    	<=1;
            f2iEn  		<=0;
            outvalid    <=0;
         end
			S14: begin
             i2pEn  		<=1;
            mulEn 		<=1;
            addEn    	<=1;
            f2iEn  		<=0;
            outvalid    <=0;
         end
			S15: begin
             i2pEn  		<=1;
            mulEn 		<=1;
            addEn    	<=1;
            f2iEn  		<=0;
            outvalid    <=0;
         end
			S16: begin
             i2pEn  		<=1;
            mulEn 		<=1;
            addEn    	<=1;
            f2iEn  		<=1;
            outvalid    <=0;
         end
			S17: begin
             i2pEn  		<=1;
            mulEn 		<=1;
            addEn    	<=1;
            f2iEn  		<=1;
            outvalid    <=0;
         end
			S18: begin
             i2pEn  		<=1;
            mulEn 		<=1;
            addEn    	<=1;
            f2iEn  		<=1;
            outvalid    <=1;
         end
         default: Next_State = S0;
      endcase
   end
endmodule