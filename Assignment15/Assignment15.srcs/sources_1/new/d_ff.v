`timescale 1ns / 1ps

// D flip flop
module d_ff(
 input clk,
 input arst,
 input d,
 output reg q,
 output  q_bar
    );
    
    always @(posedge clk or posedge arst)
     begin
       if(arst)
          q <= 0;
       else
          q <= d;
     end
     
     assign q_bar = ~q;
     
endmodule
