`timescale 1ns / 1ps


module mod_N_counter
#(parameter N = 10,
 parameter WIDTH = 4)(
  input clk,
  input rst,
  output reg [WIDTH-1:0] count
 );
 
  always @(posedge clk)
   begin
    if(rst)
      count <= 0;
    else
      begin
        if(count == N)
          count <= 0;
        else
          count <= count + 1;
      end
   end
 endmodule
