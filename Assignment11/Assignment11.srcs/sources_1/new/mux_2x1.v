`timescale 1ns / 1ps


module mux_2x1(
 input in_1,
 input in_2,
 input sel,
 output mux_out
    );
    
    assign mux_out = sel ? in_2: in_1;
endmodule
