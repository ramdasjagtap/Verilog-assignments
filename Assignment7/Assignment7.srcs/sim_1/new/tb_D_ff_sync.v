`timescale 1ns / 1ps

module tb_D_ff_sync();

reg tb_clk;
reg tb_reset;
reg tb_D;
wire tb_Q;

D_ff_sync DUT(.clk(tb_clk),.reset(tb_reset),.D(tb_D),.Q(tb_Q));
//D_ff_async DUT(.clk(tb_clk),.reset(tb_reset),.D(tb_D),.Q(tb_Q));

// clock Generation
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
   tb_reset <= 1'b1;
   tb_D <= 1'b0;
   @(posedge tb_clk);
   tb_reset <= 1'b0;
   @(posedge tb_clk);
   
   for(i=0;i<32;i=i+1)
    begin
     tb_D <= $urandom_range(0,1);
     @(posedge tb_clk);
    end
   
  end
endmodule
