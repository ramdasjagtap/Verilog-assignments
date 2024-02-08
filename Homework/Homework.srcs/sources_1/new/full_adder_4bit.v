`timescale 1ns / 1ps


module full_adder_4bit
#(parameter N=4)(
  input [N-1:0]a_in,
  input [N-1:0]b_in,
  input c_in,
  output [N-1:0]sum,
  output c_out
    );
    
    assign {c_out,sum} = a_in + b_in + c_in;
    
endmodule
