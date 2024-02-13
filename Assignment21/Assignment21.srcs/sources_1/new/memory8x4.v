
`timescale 1ns/1ps


// simple single port memory 
module memory8x4(
	input clk,
	input enable,
	input [3:0]address,
	input ReadWrite,
	input [3:0]data_in,
	output  [3:0] data_out
);

  // memory 8x4 
  reg [3:0]mem[0:7];
  reg [3:0]temp;
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