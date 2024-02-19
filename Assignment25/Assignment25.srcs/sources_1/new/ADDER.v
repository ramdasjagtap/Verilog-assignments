`timescale 1ns / 1ps

// Adder
module ADDER(
  input [15:0]data_inX,
  input [15:0]data_inY,
  output  [31:0]data_out_ADD
    );
    
    assign  data_out_ADD = data_inX + data_inY;
    
endmodule
