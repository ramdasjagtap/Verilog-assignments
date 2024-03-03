`timescale 1ns / 1ps


module counter(
 input clk,
 input decCNT,
 output reg eqz
    );
   
   reg [4:0] count; 
    always @(posedge clk)
     begin
       if(count == 0)
        begin
          eqz <= 1'b1;
        end
      else if(decCNT)
        begin
          eqz <= 1'b0;
          count <= count - 'h1;
        end
     end
     
endmodule
