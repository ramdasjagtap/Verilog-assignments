`timescale 1ns / 1ps


// asynchronous D flipflop
module D_ff_async(
input clk,
input areset,
input D,
output reg Q
    );
    
    always @(posedge clk or posedge areset)
    begin
     if(areset)
      begin
       Q <= 1'b0;
      end
     else
      begin
       Q <= D;
      end
    end
endmodule
