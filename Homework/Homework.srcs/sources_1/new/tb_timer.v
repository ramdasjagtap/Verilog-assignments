`timescale 1ns / 1ps

module tb_timer();
reg tb_clk;
reg tb_arst;
wire tb_alarm;

timer DUT(.clk(tb_clk),.arst(tb_arst),.alarm(tb_alarm));

always #3 tb_clk = ~tb_clk;

initial
 begin
  tb_arst = 1'b1;
  tb_clk = 1'b0;
  #10;
  tb_arst = 1'b0;
  #1000;
  $finish();
 end
endmodule
