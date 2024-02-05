`timescale 1ns / 1ps


// test bench
module tb_down_counter();
 reg tb_clk;
 reg tb_rst;
 wire [3:0]tb_count;
 
 down_counter DUT(.clk(tb_clk),.rst(tb_rst),.count(tb_count));
 
 
 initial 
  begin
   tb_clk = 1'b1;
   forever 
    #5 tb_clk = ~tb_clk;
  end
  
  
  integer file;
  initial
    begin
    
     file = $fopen("up_counter.txt","W");
      tb_rst <= 1'b1;
      #10;
      tb_rst <= 1'b0;
      #50;
      tb_rst <= 1'b0;
      #10;
      
      $fclose(file);
      $fdisplay(file,"Simulation over!!");
      $finish();
    end
    
    
    initial
      begin
       $fmonitor(file,"tb_rst - %b | tb_count - %d",tb_rst,tb_count);
      end
endmodule
