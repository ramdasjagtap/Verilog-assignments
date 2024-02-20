`timescale 1ns / 1ps


module mux_2x1(
 input sel,
 input [15:0]i0,
 input [15:0]i1,
 output [15:0]y
    );

  assign y = sel ? i1 : i0;
  
endmodule