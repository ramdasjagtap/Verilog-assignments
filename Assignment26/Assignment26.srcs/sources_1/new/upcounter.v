`timescale 1ns / 1ps

// 4 bit up counter
module upcounter(
 input clk,
 input rst_n,
 output reg [6:0] seg
    );
    
    reg [3:0]count;
    
    always @(posedge clk)
     begin
       if(!rst_n)
         begin
           count <= 0;
         end
      else
        begin
          if(count == 'hF)
            begin
              count <= 0;
            end
         else
           begin
              count <= count + 'h1;
           end
        end
     end
     
     // 7 segment display logic.
   always @(*)
    begin
      case(count)
       4'b0000: seg = 7'b0000001;   // A B C D E F G 
       4'b0001: seg = 7'b1001111;
       4'b0010: seg = 7'b0010010;
       4'b0011: seg = 7'b0000110;
       4'b0100: seg = 7'b1001100;
       4'b0101: seg = 7'b0100100;
       4'b0110: seg = 7'b0100000;
       4'b0111: seg = 7'b0001110;
       4'b1000: seg = 7'b0000000;
       4'b1001: seg = 7'b0000100;
       4'b1010: seg = 7'b1100010;
       4'b1011: seg = 7'b1100000;
       4'b1100: seg = 7'b1110010;
       4'b1101: seg = 7'b1000010;
       4'b1110: seg = 7'b0010000;
       4'b1111: seg = 7'b0111000;
       default: seg = 7'b0000001;
      endcase
    end
    
endmodule
