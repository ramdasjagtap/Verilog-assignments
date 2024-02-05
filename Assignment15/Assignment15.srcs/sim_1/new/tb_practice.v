`timescale 1ns / 1ps


module tb_practice();
reg a;
reg tb_clk;
wire p;
wire q;

practice DUT(.clock(tb_clk),.a(a),.p(p),.q(q));

always 
begin
 tb_clk = 1'b0;
 #5;
 tb_clk = 1'b1;
 #5;
end

initial
begin
 @(negedge tb_clk);
 a <= 1'b0;
 #10;
 @(posedge tb_clk);
  a <= 1'b1;
  #5;
  a <= 1'b0;
  #10
  a <= 1'b1;
  @(posedge tb_clk);
  $finish();
end
endmodule
