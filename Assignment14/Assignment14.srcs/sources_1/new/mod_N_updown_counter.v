`timescale 1ns / 1ps

module mod_N_updown_counter
#(parameter N= 10,
 parameter WIDTH = 4,
 parameter value = 5)(
 input clk,
 input rst,
 input mode, // mode -> 0 -> up counter
 output reg [WIDTH-1:0] count
    );
    
    
    always @(posedge clk)
     begin
      if(mode)
        begin
          if(rst)
            count = N;
          else if(count == 0)
            count = N;
          else
            count = count - 1;
        end
      else
        begin
          if(rst)
            count = 0;
          else
            count = count + 1;
        end
     end
endmodule