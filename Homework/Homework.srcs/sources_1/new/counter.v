
`timescale 1ns/1ps

module counter(
	input clk,
	input arst,
	input load_count,
	input [3:0]cnt_in,
	output reg[3:0]count
);

 always @(posedge clk or posedge arst)
	begin
		if(arst)
		begin
			count <= 0;
		end
		else
		begin
			if(load_count)
			begin
				count <= cnt_in;
			end
			else
			begin
				count <= count + 1;
			end
		end
	end
endmodule