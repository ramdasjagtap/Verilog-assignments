`timescale 1ns / 1ps


// bcd up counter 
module bcd_up_counter(
	input clk,
	input rst,
	output reg [3:0] BCD_count
);

 // BCD up counter
 always @(posedge clk)
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

endmodule