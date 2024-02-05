`timescale 1ns / 1ps

// parallel input parallel output
module tb_PIPO();
reg tb_clk;
reg tb_rst;
reg [3:0] tb_parallel_i;
wire [3:0] tb_parallel_o;

PIPO DUT(.clk(tb_clk),.rst(tb_rst),.parallel_i(tb_parallel_i),.parallel_o(tb_parallel_o));

always 
 begin
  tb_clk <= 1'b1;
  #10;
  tb_clk <= 1'b0;
  #10;
 end
 
 integer i;
 initial
  begin
   tb_rst <= 1'b1;
   tb_parallel_i <= 4'h0;
   @(posedge tb_clk);
   @(posedge tb_clk);
   tb_rst <= 1'b0;
   tb_parallel_i <= 4'hA;
   @(posedge tb_clk);
   @(posedge tb_clk);
   
   fork 
    #5 tb_parallel_i = 4'h7;
    #20 tb_parallel_i = 4'h3;
    #30 tb_parallel_i = 4'hF; 
   join
   /*
    for(i=0;i<32;i=i+1)
     begin
      tb_parallel_i <= $urandom_range(0,4'hF);
      @(posedge tb_clk);
     end
     */
     $finish();
  end
endmodule
