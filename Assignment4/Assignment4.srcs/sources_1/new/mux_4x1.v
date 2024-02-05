`timescale 1ns / 1ps

// Mux 4:1 using mux 2:1
module mux_4x1(
input in_0,
input in_1,
input in_2,
input in_3,
input [1:0]sel,
output mux_out
    );
    
    wire mux_out1,mux_out2;
    mux_2x1_gate mux1(.in_0(in_0),.in_1(in_1),.sel(sel[0]),.mux_out(mux_out1));
    mux_2x1_gate mux2(.in_0(in_2),.in_1(in_3),.sel(sel[0]),.mux_out(mux_out2));
    assign mux_out = sel[1] ? mux_out2:mux_out1;

endmodule

