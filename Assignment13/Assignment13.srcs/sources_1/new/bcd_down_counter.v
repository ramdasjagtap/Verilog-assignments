`timescale 1ns / 1ps

// BCD down counter
module bcd_down_counter(
	input clk,
	input rst,
	output reg [3:0] BCD_count
    );
    
 // BCD down counter
  always @(posedge clk)
	    begin
	   	if(rst)
			BCD_count <= 4'b1001;
		else
		 begin
		    if(BCD_count == 4'b0000)
			    BCD_count <= 4'b1001;
			else
				BCD_count <= BCD_count - 4'b0001;
		end
	   end
	
endmodule
