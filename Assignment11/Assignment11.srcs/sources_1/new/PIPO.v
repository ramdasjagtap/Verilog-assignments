`timescale 1ns / 1ps

// parallel input parallel output
module PIPO(
 input clk,
 input rst,
 input [3:0] parallel_i,
 output reg [3:0] parallel_o
    );
    
    always @(posedge clk)
     begin
       if(rst)
        parallel_o <= 4'h0;
       else
        parallel_o <= parallel_i;
     end
endmodule
