`timescale 1ns / 1ps


// Timer circuit which counts the 10 cycles and then generate the alarm.
module counter2(
 input clk,
 input arst,
 output reg alarm
    );
      
   // counter 
  reg [3:0]count;
  
  
  always @(posedge clk or posedge arst)
   begin
     if(arst)  // asynchronous reset
       begin
        alarm <= 0;
        count <= 0;
       end
     else
       begin
         if(count == 'h9) // count checker
          begin 
            alarm <= 1;
            count <= 0;
          end
         else 
          begin   
            count <= count + 1;  // count increment
            alarm <= 0;
          end
       end
   end
   
endmodule