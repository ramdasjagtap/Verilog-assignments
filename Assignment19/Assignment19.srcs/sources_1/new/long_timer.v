`timescale 1ns / 1ps

// 4 bit timer.
module long_timer(
 input clk,
 input arst,
 input TL_start,
 output TL_out
    );
    
    reg [3:0]count;
    
    always @(posedge clk or posedge arst)
     begin
       if(arst)
        begin
          count <= 0;
        end
      else
        begin
          if(TL_start)
            begin
              count <= 0;
            end
          else 
            begin
              count <= count + 1;
            end
        end
     end
   
     assign TL_out = (count == 4'b1111);
     
endmodule
