`timescale 1ns / 1ps


module tb_test();

reg tb_clk;
reg  [15:0] data_in;
wire [15:0] data_out;

datapath DUT(
.clk(tb_clk),
.data_in(data_in),
.data_out(data_out)
);
 always #5 tb_clk = ~tb_clk;
 
initial
  begin
   tb_clk = 0;
   #10;
   data_in <= 'h0fff;
   #10;
   $finish();
  end
endmodule
