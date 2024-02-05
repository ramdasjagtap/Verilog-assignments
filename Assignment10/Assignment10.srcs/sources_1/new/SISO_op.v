`timescale 1ns / 1ps

// SISO using operator
module SISO_op(
 input clk,
 input rst,
 input s_in,
 output s_out
    );
    
    reg [3:0]shift_ff;
    always @(posedge clk)
    begin
     if(rst)
      shift_ff = 4'h0;
     else
      begin
       shift_ff = shift_ff >> 1;
       shift_ff[3] = s_in;
      end
    end
    
    assign s_out = shift_ff[0];
    
endmodule
