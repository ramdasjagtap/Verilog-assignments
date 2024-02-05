`timescale 1ns / 1ps


module top_module_timer(
 input clk,
 input arst,
 output alarm
    );
    
    wire clock_out;
    timer_gen T1(.clk(clk),.arst(arst),.clk_out(clock_out));
    timer_gen2 T2(.clk(clock_out),.arst(arst),.alarm(alarm));
    
endmodule
