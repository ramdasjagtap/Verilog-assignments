`timescale 1ns / 1ps


module PISO_d(
 input clk, rst,
 input load,
 input [3:0] parallel_i,
 output serial_o
    );
    
    // sel line of mux is the load line.
    wire D3_out, D2_out, D1_out,D0_out;
    wire mux_out_3,mux_out_2,mux_out_1;
    d_ff D3(.clk(clk),.rst(rst),.d(parallel_i[3]),.q(D3_out));
    mux_2x1 MUX3(.in_1(parallel_i[2]),.in_2(D3_out),.sel(load),.mux_out(mux_out_3));
    
    d_ff D2(.clk(clk),.rst(rst),.d(mux_out_3),.q(D2_out));
    mux_2x1 MUX2(.in_1(parallel_i[1]),.in_2(D2_out),.sel(load),.mux_out(mux_out_2));
    
    d_ff D1(.clk(clk),.rst(rst),.d(mux_out_2),.q(D1_out));
    mux_2x1 MUX0(.in_1(parallel_i[0]),.in_2(D1_out),.sel(load),.mux_out(mux_out_1));
    
     d_ff D0(.clk(clk),.rst(rst),.d(mux_out_1),.q(D0_out));
     
     assign serial_o = D0_out; 
     
endmodule
