`timescale 1ns / 1ps

// 4 bit synchronous up counter.
module up_counter(
	input clk,
	input rst,
	output reg [3:0]count
);

// up counter
 always @(posedge clk)
	   begin
	  	if(!rst)
			count = count + 4'h1;
		else
			count = 4'h0;
	  end

endmodule