`timescale 1ns / 1ps

// Serial input serial output
// Non- blocking assignments
module SISO(
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
     // s_out <= 1'b0;
      q <= 4'h0;
    end
   else
    begin
     q[1] <= q[0];
      q[3] <= q[2];
      q[0] <= s_in;
      q[2] <= q[1];
    end
 end   
 

 assign s_out = q[3];
endmodule
