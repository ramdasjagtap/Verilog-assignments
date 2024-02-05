`timescale 1ns / 1ps

// timer 160 cycles
module timer #(parameter N = 8)(
	input clk,
	input arst,
	output reg alarm
);
 
 reg [N-1:0] counter;
 
 always @(posedge clk or posedge arst)
	   begin
	  	if(arst)
		 begin
		   counter <= 0;	
		   alarm <= 1'b0;
		end
		else
		 begin
			if(counter == 'hA0)
			 begin
			    alarm <= 1'b1;
			    counter <= 0;	
			end
			else
			 begin
				counter <= counter + 1;
				alarm <= 1'b0;
			end
		end
	  end
	  
endmodule