`timescale 1ns / 1ps

// Mux 2:1 using Gate primitives
module mux_2x1_gate(
input in_0,
input in_1,
input sel,
output mux_out
    );
    
    //wire declaration
   wire sel_bar;
   wire and_out_1,and_out_2;
   
   //gate primitives
   not NOT(sel_bar,sel);
   and AND1(and_out_1,in_0,sel_bar);
   and AND2(and_out_2,in_1,sel);
   or OR(mux_out,and_out_1,and_out_2);

endmodule