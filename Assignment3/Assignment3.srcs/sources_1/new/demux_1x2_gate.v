`timescale 1ns / 1ps

// demux 1:2 using gate primitives
module demux_1x2_gate(
input in,
input sel,
output [1:0]demux_out
    );
    
  wire sel_bar;
  not NOT(sel_bar,sel);
  
  and AND0(demux_out[0],sel_bar,in);
  and AND1(demux_out[1],sel,in);
endmodule
