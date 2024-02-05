`timescale 1ns / 1ps


module tb_mod_N_counter();
parameter N = 10;
parameter WIDTH = 4;
 reg tb_clk,tb_rst;
 wire [WIDTH-1:0]tb_count;
 
 
 mod_N_counter #(N,WIDTH) DUT(.clk(tb_clk),.rst(tb_rst),.count(tb_count));
 
 initial
  begin
   tb_clk = 1'b1;
   forever
    #5 tb_clk = ~tb_clk; 
  end
  
  integer file;
  initial
   begin
     file = $fopen("modN_counter.txt","w");
     tb_rst <= 1'b1;
     #10;
     tb_rst <= 1'b0;
     #20;
     tb_rst <= 1'b0;
     #50;
     tb_rst <= 1'b0;
     #100;
     tb_rst <= 1'b1;
     #10 $fdisplay(file,"Simulation over!");
     $fclose(file);
     $finish();
   end
   
   
   
  initial
   begin
    $fmonitor(file,"tb_rst - %b | tb_count - %d",tb_rst,tb_count);
   end
endmodule