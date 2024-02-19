`timescale 1ns / 1ps


module tb_updowncounter();

reg tb_clk;
reg tb_mode;
reg tb_rst_n;
wire [6:0] tb_seg;

integer file;

updowncounter DUT(.clk(tb_clk),.mode(tb_mode),.rst_n(tb_rst_n),.seg(tb_seg));

always #5 tb_clk = ~tb_clk;
  
   initial
    begin
    file = $fopen("up_counter.txt", "w");
    tb_clk <= 1'b0;
    tb_mode <= 1'b0;
     tb_rst_n <= 1'b0;
     #10  tb_rst_n <= 1'b1;
     #50 tb_rst_n <= 1'b1;
     #50 tb_rst_n <= 1'b1;
     tb_mode <= 1'b1;
     #10 tb_rst_n <= 1'b1;
     #50 tb_rst_n <= 1'b1;
     #10 $fclose(file);
     $fdisplay(file,"Simulation over");
     $finish();
    end
    
    initial
     begin
       $fmonitor(file,"Time - %d | tb_seg = %h",$time,tb_seg);
     end
     
endmodule