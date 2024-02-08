
`timescale 1ns/1ps

module tb_counter();
 reg tb_clk;
 reg tb_arst;
 reg tb_load_count;
 reg [3:0]tb_cnt_in;
 wire [3:0] tb_count;

 counter DUT(.clk(tb_clk),.arst(tb_arst),.load_count(tb_load_count),.cnt_in(tb_cnt_in),.count(tb_count));

 initial
 begin
 	tb_clk = 1'b0;
	forever 
	#5 tb_clk = ~tb_clk;
 end

 initial
 begin
 	tb_arst <= 1'b1;
	tb_load_count <= 1'b0;
	tb_cnt_in <= 0;
	#10;
	tb_arst <= 1'b0;
	#150;
	tb_load_count <= 1'b1;
	tb_cnt_in <= 4'h9;
	#200;
	tb_load_count <= 1'b0;
	#250;
	tb_arst <= 1'b1;
	#300; 
	$finish();
 end
endmodule