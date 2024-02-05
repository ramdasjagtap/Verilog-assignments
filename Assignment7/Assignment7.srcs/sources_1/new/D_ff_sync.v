`timescale 1ns / 1ps

// synchronous D flipflop 
module D_ff_sync(
input clk,
input reset,
input D,
output reg Q
    );
    
    always @(posedge clk)
    begin
     if(reset)
      begin
       Q <= 1'b0;
      end
     else
      begin
       Q <= D;
      end
    end
endmodule
