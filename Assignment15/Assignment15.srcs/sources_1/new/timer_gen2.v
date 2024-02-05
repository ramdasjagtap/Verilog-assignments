`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module timer_gen2(
 input clk,
 input arst,
 output reg alarm
    );
    
    reg  [3:0]count2;
    always @(posedge clk or posedge arst)
      begin
       if(arst)
         begin
          alarm <= 0;
          count2 <= 0;
         end
       else
        begin
         if(count2 == 'h5)
          begin
           alarm <= 1;
           count2 <= 0;
          end
         else
          count2 <= count2 + 1;
        end
      end
endmodule
