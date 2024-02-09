`timescale 1ns / 1ps

module parameterized_memory
#(parameter WIDTH=4,
parameter DEPTH=8)(
	input clk,arst,
	input enable,
	input [WIDTH-1:0]address,
	input ReadWrite,
	input [WIDTH-1:0]data_in,
	output reg [WIDTH-1:0] data_out
);

  // memory 8x4 
  reg [WIDTH-1:0]mem[0:DEPTH-1];
  integer i;
  // memory reading and writing logic.
  always @(posedge clk)
		begin 
			if(arst)
			  begin
			   for(i=0;i<8;i=i+1)
			     begin
			       mem[i] <= 0;
			     end
			  end
		   else  if(enable && !ReadWrite)  // RW = 0 -> writing data in memory
			begin
				mem[address] <= data_in;
			end
			else if(enable && ReadWrite)  // RW = 1 -> reading data from memory
			begin
				data_out <= mem[address];
			end
		end
		
endmodule