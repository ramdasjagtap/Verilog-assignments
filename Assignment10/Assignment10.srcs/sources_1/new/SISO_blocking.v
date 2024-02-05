`timescale 1ns / 1ps

// Serial input serial output
// Non- blocking assignments
module SISO_blocking(
 input clk,
 input rst,
 input s_in,
 output s_out
    );
 
 // 4 bit siso
 // we need 4 flip flop;
 reg [3:0]q;

 always @(posedge clk)
 begin
   if(rst)
    begin 
      q = 4'h0;
    end
   else
    begin
      q[3] = q[2];
      q[2] = q[1];
      q[1] = q[0];
      q[0] = s_in;
    end
 end   
 
 
 assign s_out = q[3];
endmodule
