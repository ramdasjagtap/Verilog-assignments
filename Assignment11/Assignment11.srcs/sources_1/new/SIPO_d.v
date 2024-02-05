`timescale 1ns / 1ps


module SIPO_d(
 input clk,rst,
 input serial_i,
 output [3:0]parallel_o
    );
    
    d_ff D0(.clk(clk),.rst(rst),.d(serial_i),.q(parallel_o[3]));
    d_ff D1(.clk(clk),.rst(rst),.d(parallel_o[3]),.q(parallel_o[2]));
    d_ff D2(.clk(clk),.rst(rst),.d(parallel_o[2]),.q(parallel_o[1]));
    d_ff D3(.clk(clk),.rst(rst),.d(parallel_o[1]),.q(parallel_o[0]));


endmodule
