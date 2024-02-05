`timescale 1ns / 1ps


// extra work
module SIPO_extrawork(
	input clk,
	input rst,
	input serial_i,
	output reg [3:0]parallel_o
);

reg [3:0] shift_ff;
reg [2:0] count;
always @(posedge clk)
 begin
	if(rst)
	  begin
		shift_ff <= 0;
		count <= 0;
	  end
	else
	  begin
		shift_ff <= {serial_i,shift_ff[3:1]};
		count <= count + 3'h1;
	  end
 end


always @(*)
 begin
   if(count == 3'h4)
     begin
        parallel_o = shift_ff;
        count = 0;
     end
   else
     begin
        parallel_o = 0;
        // parallel_o = z;
     end
 end
 
//assign parallel_o = shift_ff;

endmodule