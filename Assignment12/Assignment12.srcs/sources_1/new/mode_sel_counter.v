`timescale 1ns / 1ps


// synchrounous mode select counter

module mod_sel_counter(
	input clk,
	input rst,
	input mode,
	output reg [3:0] count
);

// mode == 0 -> upcounter
// mode == 1 -> downcounter

 always @(posedge clk)
	   begin
	  	if(!mode)
		 begin
			if(rst)
				count <= 4'h0;
			else
				count <= count + 4'h1;
		end
		else
		 begin
			if(rst)
				count <= 4'hF;
			else
				count <= count - 4'h1;
		end

	  end
endmodule
