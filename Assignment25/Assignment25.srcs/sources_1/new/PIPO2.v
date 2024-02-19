`timescale 1ns / 1ps

// parallel input parallel output with load and clear
module PIPO2(
  input clk,
  input ldP,
  input clrP,
  input [15:0]data_in_P,
  output reg [15:0]data_out_P
    );
    
    always @(posedge clk)
      begin
        if(clrP)
          begin
            data_out_P <= 0;
          end
        else if(ldP)
           begin
            data_out_P <= data_in_P;
           end
      end
endmodule
