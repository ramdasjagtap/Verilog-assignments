`timescale 1ns / 1ps


// siso using d ff.
module SISO_d(
input clk,
input rst,
input s_in,
output s_out
    );
    
    wire q0,q1,q2;
    
    d_ff DFF0(.clk(clk),.rst(rst),.d(s_in),.q(q0));
    d_ff DFF1(.clk(clk),.rst(rst),.d(q0),.q(q1));
    d_ff DFF2(.clk(clk),.rst(rst),.d(q1),.q(q2));
    d_ff DFF3(.clk(clk),.rst(rst),.d(q2),.q(q3));
    
    assign s_out = q3;

endmodule
