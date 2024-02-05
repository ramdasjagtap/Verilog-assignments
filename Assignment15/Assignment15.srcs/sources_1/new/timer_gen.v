`timescale 1ns / 1ps

// timer using generate block
module timer_gen(
  input  clk,
  input  arst,
  output reg clk_out
);

reg [4:0] count;
always @(posedge clk or posedge arst)
 begin
  if(arst)
   begin
     clk_out <= 0;
     count <= 0;
   end
  else
   begin
    if(count == 5'h1F)
      begin
        clk_out <= 1;
        count <= 0;
      end
    else
     begin
        count <= count + 1;
        clk_out <= 0;
     end
   end
 end
endmodule
