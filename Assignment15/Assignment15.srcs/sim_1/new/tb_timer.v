`timescale 1ns / 1ps

// test bench
module tb_timer();
parameter N = 8;

reg tb_clk;
reg tb_arst;
wire tb_alarm;

// module instance
timer #(8) DUT(.clk(tb_clk),.arst(tb_arst),.alarm(tb_alarm));

 initial
 begin
  tb_clk = 1'b1;
  forever
   #5 tb_clk = ~tb_clk;
  end
  
  
  integer file;
  initial
   begin
     file = $fopen("Timer.txt","w");
     tb_arst <= 1'b1;
     #10;
     tb_arst <= 1'b0;
     #20;
     tb_arst <= 1'b0;
     #300;
     #10 $fclose(file);
     $fdisplay(file,"Simulation Over!!");
     $finish();
   end
  
  initial
   begin
   $fmonitor(file,"Time - %d | tb_arst - %b | tb_alarm - %b ",$time,tb_arst,tb_alarm);
   end
endmodule
