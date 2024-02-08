
`timescale 1ns / 1ps


//testbench
module tb_sequence_detector();
reg tb_clk;
reg tb_rst;
reg tb_seq_i;
wire tb_detect_o;

// module instance
// sequence_detector DUT(.clk(tb_clk),.rst(tb_rst),.seq_i(tb_seq_i),.detect_o(tb_detect_o));
 moore_seq_detect DUT(.clk(tb_clk),.rst(tb_rst),.seq_i(tb_seq_i),.detect_o(tb_detect_o));

 // clock
 initial
 begin
	 tb_clk = 1'b0;
 forever
 #5 tb_clk = ~tb_clk;
 end

  // sequence
   reg [4:0] seq = 5'b10110;
 // generating stimulus
 integer i;
 initial
 begin
 	tb_rst <= 1'b1;
	tb_seq_i <= 0;
	#10;
	tb_rst <= 1'b0;
	#10;
	for(i=0;i<512;i=i+1)
	begin
		#8 tb_seq_i <= $urandom_range(0,5'h1F);
	end

	for(i=0;i<5;i=i+1)
	begin
		tb_seq_i <= seq[i];
		#5;
	end
	 tb_rst <= 1'b0;
	 #10;
	 tb_rst <= 1'b0;
	 tb_seq_i <= 1'b0;
	 #50;
	 tb_seq_i <= 1'b1;
	 #7;
	 tb_seq_i <= 1'b0;
	 #6;
	 tb_seq_i <= 1'b1;
	 #5;
	 tb_seq_i <= 1'b1;
	 #6;
	 tb_seq_i <= 1'b0;
	 #5;
	 tb_seq_i <= 1'b0;
	#1000;
	$finish();
 end
 

 initial
 begin
 	$monitor("Time - %d | tb_rst - %b | tb_seq_i - %b ",$time,tb_rst,tb_seq_i);
 end
endmodule