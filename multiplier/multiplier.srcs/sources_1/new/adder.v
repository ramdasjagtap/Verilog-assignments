`timescale 1ns / 1ps

// adder 
module adder (
 input [15:0]a,b,
 input ci, addsub,
 output co,
 output [15:0]s
 );
 
  assign {co, s} = (addsub) ? a + b + ci: a - b + ci;
  
endmodule