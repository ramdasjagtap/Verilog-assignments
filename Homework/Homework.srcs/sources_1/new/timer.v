`timescale 1ns / 1ps

// this is the top module of timer which is combination of frequency divider and counter.
module timer(
 input clk,
 input arst,
 output alarm_o
    );
    
    // wire declaration which acts as clock to timer.
    wire clk_out;
    
    // frequency divider which divides the frequency by 16.
    freq_divider FD(.clk(clk),.arst(arst),.freq_div(clk_out));
    
    
    // counter which gives the count of 10.
    timer_counter TC(.clk(clk_out),.arst(arst),.alarm(alarm_o));
    
endmodule
