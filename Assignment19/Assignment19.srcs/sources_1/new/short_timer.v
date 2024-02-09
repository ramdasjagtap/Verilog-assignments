`timescale 1ns / 1ps


module short_timer(
 input clk,
 input arst,
 input TS_start,
 output TS_out
    );
    
    reg [2:0] count;
    always @(posedge clk or posedge arst)
     begin
       if(arst)
         begin
           count <= 0;
         end
       else
        begin
          if(TS_start)
           begin
             count <= 0;
           end
         else 
           begin
             count <= count + 1;
           end 
        end
     end
     
     assign TS_out = (count == 3'b111);
 
endmodule
