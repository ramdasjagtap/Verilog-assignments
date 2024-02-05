`timescale 1ns / 1ps

// SISO using shifting
module SISO_shift(
 input clk,
 input rst,
 input s_in,
 output  s_out
    );
    
    reg [3:0]shift_ff = 4'b0000;
    always @(posedge clk)
    begin
     if(rst)
      shift_ff <= 4'b0000;
     else
      begin
       shift_ff <= {s_in,shift_ff[3:1]};
      end
    end
    
    assign s_out = shift_ff[0];
    
endmodule
