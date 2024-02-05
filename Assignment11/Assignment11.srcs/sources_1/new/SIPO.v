`timescale 1ns / 1ps


// Serial input serial output shift register.
module SIPO(
 input clk,rst,
 input serial_i,
 output  [3:0] parallel_o
    );
    
    reg [3:0] shift_ff;
    always @ (posedge clk)
     begin
      if(rst)
        shift_ff <= 0;
      else
        shift_ff <= {serial_i,shift_ff[3:1]};
     end
     
     assign parallel_o = shift_ff;
endmodule
