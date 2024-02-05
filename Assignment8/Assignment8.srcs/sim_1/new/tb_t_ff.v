`timescale 1ns / 1ps


// test bench for t flip flop
module tb_t_ff();

reg tb_clkn;
reg tb_rst;
reg tb_t;
wire tb_q;

// module instance
//t_ff DUT(.clkn(tb_clkn),.rst(tb_rst),.t(tb_t),.q(tb_q));
t_using_d DUT(.clkn(tb_clkn),.rst(tb_rst),.t(tb_t),.q(tb_q));

always 
 begin
  tb_clkn = 1'b0;
  #10;
  tb_clkn = 1'b1;
  #10;
 end
 
 integer i;
 // Generating stimulus
 initial
 begin
  tb_rst  <= 1'b1;
  tb_t <= 1'b0;
  @(negedge tb_clkn);
  tb_rst <= 1'b0;
  @(negedge tb_clkn);
  
  // inter delay
  #10 tb_t <= tb_clkn & 1'b1;
  @(negedge tb_clkn);
  #10 tb_t <= tb_clkn | 1'b1;
  @(negedge tb_clkn);
   for(i =0;i<16;i=i+1)
   begin
     tb_t <= $urandom() % 2;
     @(negedge tb_clkn);
   end

$finish();
 end
 
 
 initial
 begin
  $monitor("Time - %d, tb_rst - %b, tb_t- %b ",$time,tb_rst,tb_t);
 end
endmodule
