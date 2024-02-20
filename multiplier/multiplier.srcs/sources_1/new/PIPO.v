`timescale 1ns / 1ps


module PIPO(
 input clk,
 input rst,
 input ld,
 input [15:0]data_in,
 output reg [15:0]data_out
    );
    
    always @(posedge clk)
     begin
      if(rst)
       begin
         data_out <= 0;
       end
     else if(ld)
        begin
          data_out <= data_in;
        end
     end
     
endmodule
