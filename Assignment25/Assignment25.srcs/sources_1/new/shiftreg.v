`timescale 1ns / 1ps

// shiftreg
module shiftreg(
 input clk,
 input serial_i,
 input ld,
 input sft,
 input clr,
 input [15:0]data_in,
 output reg [15:0]data_out
    );
    
    always @(posedge clk)
      begin
        if(clr)
          begin
            data_out <= 'h0;
          end
        else if(ld)
          begin
            data_out <= data_in;
          end
        else if(sft)
          begin
            data_out <= {serial_i,data_out[15:1]};
          end
      end
      
endmodule
