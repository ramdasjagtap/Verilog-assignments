`timescale 1ns / 1ps

// Reg B
module CNTR(
 input clk,
 input ldB,
 input decB,
 input [15:0]data_in_B,
 output reg [15:0]data_out_B
    );
    
    always @(posedge clk)
      begin
       if(ldB)
         begin
           data_out_B <= data_in_B;
         end
      else if(decB)
         begin
           data_out_B <= data_out_B  - 'h1;
         end
      end
      
endmodule