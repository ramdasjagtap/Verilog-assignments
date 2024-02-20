`timescale 1ns / 1ps

module datapath (
input clk,
input [15:0]data_in,
input addorsub,ldY,clrE,ldE,clrA,ldA,shA,ldX,shX,sel,
output x0,x1,
output [15:0]data_out);
  
  wire [15:0] a_out, y_out, x_out, sum;
  wire cout;
  
  adder add_4b (a_out, y_out, 1'b0, addorsub , cout, sum);
  reg_5b Y(data_in, ldY, clk, y_out);
  d_ff E(x1 , clrE, ldE, clk, x0);
  shreg_5b A(sum, a_out[4], clrA, ldA, shA, clk, a_out);
  shreg_5b X(data_in, a_out[0], 1'b0, ldX, shX, clk, x_out);
  mux_2x1 mux(a_out, x_out, sel , data_out);
  
  assign x1 = x_out[0];
 
endmodule  

