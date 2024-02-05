`timescale 1ns / 1ps

// t flip flop using d flip flop
module t_using_d(
input clk,
input rst,
input t,
output q 
    );
    
    wire d_q;
    wire in_t;
    
    // new input to D ff
    assign in_t = d_q ^ t;
    
    // d flip flop
    d_ff  DFF(.clk(clk),.rst(rst),.d(in_t),.q(d_q));
    
    assign q = d_q;
endmodule
