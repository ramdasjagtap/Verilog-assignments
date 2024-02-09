`timescale 1ns/1ps

// datapath to perform concatination operation.
module datapath(
	input clk,
	input en,
	input clr,
	input [3:0]A,B,
	output reg done,
	output reg [7:0]data_path_out
);

   always @(posedge clk)
    begin
		if(en && !clr)
		 begin
			data_path_out <= {A,B};
			done <= 1'b1;
		end
		else if(en && clr)
		 begin
			data_path_out <= 8'hzz;
			done <= 1'b0;
		end
		else
		 begin
		  data_path_out <= 'hzz;
		  done <= 1'b0;
		 end
	end
endmodule