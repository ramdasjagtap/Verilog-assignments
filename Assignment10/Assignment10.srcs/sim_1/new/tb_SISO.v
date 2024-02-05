`timescale 1ns / 1ps


/// test bench for siso
module tb_SISO();
reg tb_clk;
reg tb_rst;
reg tb_s_in;
wire tb_s_out;


SISO_op DUT(.clk(tb_clk),.rst(tb_rst),.s_in(tb_s_in),.s_out(tb_s_out));

always 
 begin
  tb_clk = 1'b1;
  #10;
  tb_clk = 1'b0;
  #10;
 end
 
 integer i;
 initial
  begin
   tb_rst <= 1'b1;
   tb_s_in <= 1'b0;
   @(posedge tb_clk);
   tb_rst <= 1'b0;
   @(posedge tb_clk);
   @(posedge tb_clk);
    for(i=0;i<16;i=i+1)
     begin
      tb_s_in <= $urandom() % 2;
      @(posedge tb_clk);
     end
     
     $finish();
  end
  

endmodule
