`timescale 1ns / 1ps


module tb_freq_divider();

reg clk;
reg arst;
wire q;

freq_divider DUT(.clk(clk),.arst(arst),.q(q));

always #5 clk = ~clk;

initial
 begin
   arst <= 1'b1;
   clk <= 1'b0;
   #10;
   arst <= 1'b0;
   #1000;
   $finish();
 end
endmodule
