`timescale 1ns / 1ps


// D ff
module d_ff(
input clk,
input rst,
input d,
output reg q
    );
    
    always @(posedge clk)
    begin
     if(rst)
       q <= 1'b0;
     else
       q <= d;
    end
endmodule
