`timescale 1ns / 1ps

// counter 
// which maintains the count of bits.
module counter(
 input clk,
 input decr,
 input ldcnt,
 output reg [4:0]data_out
    );
    
    always @(posedge clk)
     begin
       if(ldcnt)
         begin
           data_out <= 16;
         end
       else if(decr)
         begin
           data_out <= data_out - 1;
         end
     end
     
endmodule
