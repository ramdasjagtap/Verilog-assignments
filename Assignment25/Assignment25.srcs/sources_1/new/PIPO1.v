`timescale 1ns / 1ps

// parallel input parallel output with load
module PIPO1(
 input clk,
 input ldA,
 input [15:0]data_in_A,
 output reg [15:0]data_out_A
    );
    
    always @(posedge clk)
      begin
        if(ldA)
          begin
            data_out_A <= data_in_A;
          end
      end
endmodule
