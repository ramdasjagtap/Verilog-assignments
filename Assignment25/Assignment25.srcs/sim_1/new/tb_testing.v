`timescale 1ns / 1ps


module tb_testing();

reg tb_clk;
reg tb_decr;
reg tb_ldcnt;
wire [3:0]tb_data_out;

counter DUT(
 .clk(tb_clk),
 .decr(tb_decr),
 .ldcnt(tb_ldcnt),
 .data_out(tb_data_out)
);
always #5 tb_clk = ~tb_clk;

initial
  begin
    tb_clk <= 1'b0;
    tb_ldcnt <= 1'b0;
    tb_decr <= 1'b0;
    #5;
    tb_ldcnt <= 1'b1;
    #10;
    tb_ldcnt <= 1'b0;
    tb_decr <= 1'b1;
   #100;
   $finish();
  end
endmodule
