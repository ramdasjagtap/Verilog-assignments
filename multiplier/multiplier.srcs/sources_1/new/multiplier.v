`timescale 1ns / 1ps

// top module
module multiplier(
 input clk, 
 input rst,
 input start, 
 input [15:0]data_in,
 input [15:0]data_out,
 output done
 );
 
  wire ldY, clrE, ldE, clrA, ldA, shA, ldX, shX, sel, x0, x1, addsub;
  
  datapath   dp(data_in, addsub, ldY, clrE, ldE, clrA, ldA, shA, ldX, shX, sel, clk, x0, x1, data_out);
  controller cu(start, x0, x1 ,rst, clk, ldY, ldE, clrE, clrA, ldA, shA, ldX, shX, sel, done, addsub);
  
endmodule
