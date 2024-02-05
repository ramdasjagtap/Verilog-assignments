`timescale 1ns / 1ps

// negative edge triggered flip flop
module t_ff(
input clkn,
input rst,
input t,
output reg q
    );
    
    always @(negedge clkn)
    begin
    if(rst)
    begin
      q <= 1'b0;
    end
    else begin
      if(t)
       begin
        q <= ~q;
       end
      else
       begin
        q <= q;
       end 
    end
    end
endmodule
