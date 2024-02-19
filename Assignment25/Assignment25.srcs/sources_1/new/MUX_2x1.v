`timescale 1ns / 1ps

// multiplexer 2:1
module MUX_2x1(
 input sel,
 input [15:0]inA,inB,
 output [15:0]mux_out
    );
    
    assign mux_out = sel ? inB :inA;
    
endmodule
