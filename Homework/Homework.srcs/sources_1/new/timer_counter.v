`timescale 1ns / 1ps

// counter which counts the clock cycles.
// we have to count 10 clock cycles.
module timer_counter(
 input clk,
 input arst,
 output reg alarm
    );
    
    reg [3:0] count;
    always @(posedge clk or posedge arst)
     begin
       if(arst)
         begin
           alarm <= 0;
           count <= 0;
         end
       else
        begin
           if(count == 'h9)
             begin
               alarm <= 1;
               count <= 0;
             end
           else
             begin
               alarm <= 0;
               count <= count + 1;
             end
        end
     end
     
endmodule
