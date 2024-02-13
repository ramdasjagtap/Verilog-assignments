`timescale 1ns / 1ps

module parameterized_memory
#(parameter WIDTH=4,
parameter DEPTH=8)(
	input clk,
	input enable,
	input [WIDTH-1:0]address,
	input ReadWrite,
	input [WIDTH-1:0]data_in,
	output  [WIDTH-1:0] data_out
);

  // memory 8x4 
  reg [WIDTH-1:0]mem[0:DEPTH-1];
  reg [WIDTH-1:0]temp;
  integer i;
  
  // memory reading and writing logic.
  always @(posedge clk)
	begin
	       if(enable && !ReadWrite)  // RW = 0 -> writing data in memory
			begin
				mem[address] <= data_in;
			end
		end
		
		always @(posedge clk)
		  begin
		    if(enable && ReadWrite)  // RW = 1 -> reading data from memory
			begin
				temp <= mem[address];
			end
		  end
		  
		  assign data_out = (enable && ReadWrite)?temp:'hzz;
endmodule