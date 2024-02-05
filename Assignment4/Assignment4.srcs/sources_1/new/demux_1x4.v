`timescale 1ns / 1ps

// Demux 1:4 using demux 1:2
module demux_1x4(
input in,
input [1:0]sel,
output demux_out0,
output demux_out1,
output demux_out2,
output demux_out3
    );
    
    wire demux_out0_wire,demux_out1_wire;
    demux_1x2_gate DMUX0(.in(in),.sel(sel[0]),.demux_out0(demux_out0_wire),.demux_out1(demux_out1_wire));
    demux_1x2_gate DMUX1(.in(demux_out0_wire),.sel(sel[1]),.demux_out0(demux_out0),.demux_out1(demux_out2));
    demux_1x2_gate DMUX2(.in(demux_out1_wire),.sel(sel[1]),.demux_out0(demux_out1),.demux_out1(demux_out3));

endmodule
