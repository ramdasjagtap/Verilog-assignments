`timescale 1ns / 1ps

// test bench
module tb_mealy_fsm();
reg tb_clk;
reg tb_rst_n;
reg tb_seq_i;
wire tb_det_o;

mealy_fsm DUT(.clk(tb_clk),.rst_n(tb_rst_n),.d_in(tb_seq_i),.q_out(tb_det_o));

always #5 tb_clk = ~tb_clk;

integer i;
initial
  begin
    tb_rst_n <= 1'b1;
    tb_clk <= 1'b0;
    tb_seq_i <= 1'b0;
    #10;
    tb_rst_n <= 1'b0;
    #5
    
    for(i=0;i<512;i=i+1)
      begin
        tb_seq_i <= $urandom_range(0,1);
        @(negedge tb_clk);
      end
      
      #10;
      $finish();
  end
endmodule
