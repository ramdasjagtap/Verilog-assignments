`timescale 1ns / 1ps


// Down counter
module down_counter(
 input clk,rst,
 output reg [3:0]count
    );
    
    // dowm counter
 always @(posedge clk)
  begin
 	if(!rst)
		count = count - 4'h1;
	else
		count = 4'hF;
 end
 
endmodule