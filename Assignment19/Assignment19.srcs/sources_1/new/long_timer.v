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
         /* if(TL_start)
            begin
              count <= 0;
            end
          else */
            begin
              count <= count + 1;
            end
        end
     end
   
     assign TL_out = (count == 4'b1111);
     
endmodule

/*
 reg [3:0] count;
    reg count1;
    always @(posedge clk)
     begin
       if(arst)
         begin
           count <= 0;
           count1 <= 0;
         end
       else
        begin
         if(TL_start)
           begin
            count1 <= 1;
            count <= count + 1;
           end
         else 
           begin
             if(count1)
               begin
                count <= count + 1;
               end
              else if(count == 4'b1111)
               begin
                count <= 0;
               end
           end
        end
     end
     
*/