`timescale 1ns / 1ps


module tb_D_latch();

reg tb_clk;
reg tb_reset;
reg tb_D;
wire tb_Q;

D_latch DUT(.clk(tb_clk),.reset(tb_reset),.D(tb_D),.Q(tb_Q));

 reg [2:0] delay1;  
 reg [1:0] delay2;  
 
 integer j=0;  
   initial
   begin
   tb_reset <= 1'b0;
   tb_clk <= 1'b0;
   tb_D <= 1'b0;
   #10;
   tb_reset <= 1'b1;
   
   for(j=0;j<8;j=j+1)
   begin
    delay1 <= $urandom_range(0,3'h7);
    delay2 <= $urandom_range(0,2'h3);
    
    #(delay1);
    tb_clk = ~tb_clk;
    
    #(delay2);
    tb_D = j;
   end
   
   end
   
   initial
   begin
      $monitor ("Time = %d | tb_clk = %b | tb_reset =%b | tb_D = %b | tb_Q = %b", $time, tb_clk,tb_reset, tb_D, tb_Q);  
   end
endmodule
