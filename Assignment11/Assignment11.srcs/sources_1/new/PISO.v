`timescale 1ns / 1ps

module PISO(
	input clk,
	input rst,
	input load,
	input [3:0]parallel_i,
	output serial_o
);

 reg [3:0]shift_ff;

 always @(posedge clk)
	  begin
	  	if(rst)
	     begin
			shift_ff <= 0;
		 end
		else
		  begin
			if(load)
				shift_ff <= parallel_i;
			else
			 begin
				shift_ff <= {1'b0,shift_ff[3:1]};
			 end
		end
	  end
	  assign serial_o = shift_ff[0];
endmodule