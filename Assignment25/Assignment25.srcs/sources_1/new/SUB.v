`timescale 1ns / 1ps

// subtractor
module SUB(
 input [15:0]inA,inB,
 output reg [15:0] sub_out
    );
    
    always @(*)
      begin
        sub_out = inA - inB;
      end
      
endmodule
