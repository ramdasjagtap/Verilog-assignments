`timescale 1ns / 1ps

// Testbench 
module tb_top_module();
 reg tb_clk;
 reg tb_arst;
 wire tb_alarm;
 
 // module instance
  //top_module_timer DUT(.clk(tb_clk),.arst(tb_arst),.alarm(tb_alarm));
 timer DUT(.clk(tb_clk),.arst(tb_arst),.alarm_o(tb_alarm));
 
  // clock generation
  initial
   begin
     tb_clk <= 1'b1;
     forever 
      #2 tb_clk = ~tb_clk;
   end
   
   //Generating stimulus
   integer file;
   initial
     begin
     file = $fopen("top_module.txt","w");
      tb_arst <= 1'b1;
      #10;
      tb_arst <= 1'b0;
      #50;
      tb_arst <= 1'b0;
      #1000;
      tb_arst <= 1'b1;
      #10;
      tb_arst <= 1'b0;
      #10 $fclose(file);
      $fdisplay(file,"Simulation Over!!");
      $finish();
     end
     
     initial
      begin
        $fmonitor(file,"tb_arst <= %b | tb_alarm - %b ",tb_arst,tb_alarm);
      end
endmodule