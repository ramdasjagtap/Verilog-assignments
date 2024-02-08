`timescale 1ns / 1ps

// User defined primitives.
// combinational circuit.

primitive mux_4x1(mux_out,sel_1,sel_0,in_0,in_1,in_2,in_3);
 output mux_out;
 input in_0,in_1,in_2,in_3;
 input sel_0,sel_1;
 
 // logic
 table
  // sel_1 sel_0 in_0 in_1 in_2 in_3   out
  0 0 0 ? ? ? : 0;
  0 0 1 ? ? ? : 1;
  0 1 ? 0 ? ? : 0;
  0 1 ? 1 ? ? : 1;
  1 0 ? ? 0 ? : 0;
  1 0 ? ? 1 ? : 1;
  1 1 ? ? ? 0 : 0;
  1 1 ? ? ? 1 : 1;
  x x 0 0 0 0 : 0;
  x x 1 1 1 1 : 1;
 endtable
endprimitive

/*
module mux_4x1(
 input [3:0]in,
 input [1:0]sel,
 output mux_out
    );
    
endmodule
*/