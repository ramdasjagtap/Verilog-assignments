`timescale 1ns / 1ps


module PIPO_d(
 input clk,rst,
 input [3:0]parallel_i,
 output [3:0]parallel_o
    );
    
    d_ff D0(.clk(clk),.rst(rst),.d(parallel_i[0]),.q(parallel_o[0]));
    d_ff D1(.clk(clk),.rst(rst),.d(parallel_i[1]),.q(parallel_o[1]));
    d_ff D2(.clk(clk),.rst(rst),.d(parallel_i[2]),.q(parallel_o[2]));
    d_ff D3(.clk(clk),.rst(rst),.d(parallel_i[3]),.q(parallel_o[3]));

endmodule
