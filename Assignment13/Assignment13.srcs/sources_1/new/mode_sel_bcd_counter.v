`timescale 1ns / 1ps

// mode select bcd counter
module mode_sel_bcd_counter(
	input clk,
	input rst,
	input mode,
	output reg [3:0] BCD_count
    );
// mode select BCD counter
 always @(posedge clk)
  begin
 	if(mode)
	 begin
			if(rst)
		BCD_count = 4'b0000;
	else
		 begin
			if(BCD_count == 4'b1001)
			 begin
				BCD_count = 4'b0000;
			end
			else
		  begin
				BCD_count = BCD_count + 4'b0001;
			end
		end
	end
	else
	 begin
	   	if(rst)
			BCD_count = 4'b1001;
		else
		 begin
		        if(BCD_count == 4'b0000)
				BCD_count = 4'b1001;
			else
				BCD_count = BCD_count - 4'b0001;
		end
	   end
	
        end

endmodule