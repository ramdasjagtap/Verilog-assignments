`timescale 1ns / 1ps

module d_ff(
  input clk,
  input clr,   // reset
  input d,
  output reg q
    );
    
    always @(posedge clk)
     begin
      if(clr)
        begin
          q <= 0;
        end
      else
        begin
          q <= d;
        end
     end
     
endmodule
