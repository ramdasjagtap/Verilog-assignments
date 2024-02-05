`timescale 1ns / 1ps

// D latch
module D_latch(
input clk,reset,
input D,
output reg Q
    );
    
    always @(clk or reset or D)
    begin
    if(reset == 1'b1)
     begin
      Q <= 1'b0;
     end
    else if(clk == 1'b1)
     begin
       Q <= D;
     end
    end
  
endmodule
