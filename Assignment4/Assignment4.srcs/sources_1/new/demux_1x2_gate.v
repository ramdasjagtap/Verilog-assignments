`timescale 1ns / 1ps

// demux 1:2 using gate
module demux_1x2_gate(
input in,
input sel,
output demux_out0,demux_out1
    );
    
  wire sel_bar;
  not NOT(sel_bar,sel);
  
  and AND0(demux_out0,sel_bar,in);
  and AND1(demux_out1,sel,in);
endmodule
