`timescale 1ns / 1ps

// D flip flop.
module d_ff(
 input clk,
 input arst,
 input d,
 output reg q
    );
    
    always @(posedge clk)
     begin
       if(arst)
        begin
          q <= 0;
        end
      else
        begin
          q <= d;
        end
     end
endmodule
