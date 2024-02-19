`timescale 1ns / 1ps

//parallel in parallel out
module PIPO(
 input clk,
 input ld,
 input [15:0]data_in,
 output reg[15:0]data_out
    );
    
    always @(posedge clk)
      begin
       if(ld)
         begin
            data_out <= data_in;
         end
      end
      
endmodule
