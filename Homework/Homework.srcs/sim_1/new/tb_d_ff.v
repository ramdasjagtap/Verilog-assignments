`timescale 1ns / 1ps


module tb_d_ff();
 reg clk;
 reg arst;
 reg d;
 wire q;
 
 d_ff DUT(.clk(clk),.arst(arst),.d(d),.q(q));
 
 always #5 clk = ~clk;
 
 initial
   begin
      arst <= 1'b1;
      clk <= 1'b0;
      d <= 1'b0;
      #10;
      arst <= 1'b0;
      d <= 1'b1;
      #100;
   end
endmodule
