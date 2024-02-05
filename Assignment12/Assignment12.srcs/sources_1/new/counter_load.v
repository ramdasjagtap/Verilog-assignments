`timescale 1ns / 1ps

// load counter

module counter_load(
	input clk,
	input rst,
	input mode,
	input [2:0] count_val,
	output reg [3:0] count
);

// mode == 0 -> upcounter
// mode == 1 -> downcounter

 always @(posedge clk)
	   begin
	  	if(!mode)
		 begin
			if(rst)
				count = 4'h0;
			else
				begin
				  if(count_val)
				      count = count_val + 4'h1;
				end
		end
		else
		 begin
			if(rst)
				count = 4'hF;
			else
				begin
				  if(count_val)
				    begin
				      count = count_val - 4'h1;
				    end
				end
		end

end
endmodule