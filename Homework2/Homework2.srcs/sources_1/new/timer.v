`timescale 1ns / 1ps


// top module of timer.
module timer(
 input clk,
 input arst,
 output alarm_o
    );
    
    // Generating clock from counter 1 which acts as clock to next counter.
    // clk output
    wire clk_out;
    
    // counter 1 instance
    counter1 CLKDIV(.clk(clk),.arst(arst),.q(clk_out));
    
    
    // counter 2 instance.
    counter2 TIMER(.clk(clk_out),.arst(arst),.alarm(alarm_o));
    
endmodule