`timescale 1ns / 1ps


module tb_pattern_detector();
reg tb_clk;
reg tb_arst;
reg tb_seq_i;
wire [3:0]tb_count;

pattern_detector DUT(.clk(tb_clk),.arst(tb_arst),.seq_i(tb_seq_i),.count(tb_count));

always #2 tb_clk = ~tb_clk;

integer i;
integer file;
initial
  begin
   file = $fopen("Pattern_detector.txt","w");
   tb_arst <= 1'b1;
   tb_clk <= 1'b0;
   tb_seq_i <= 1'b0;
   #10;
   tb_arst <= 1'b0;
   #5;
   
   for(i=0;i<512;i=i+1)
     begin
       tb_seq_i <= $urandom_range(0,1);
       @(posedge tb_clk);
     end
     #1000;
     #10 $fclose(file);
     $fdisplay(file,"Simulation over!");
     //$finish();
  end
  
  
  initial
   begin
     $fmonitor(file,"Time - %d | tb_arst - %b | tb_clk - %b | tb_seq_i -%b |tb_count - %d",$time,tb_arst,tb_clk,tb_seq_i,tb_count);
   end
endmodule
