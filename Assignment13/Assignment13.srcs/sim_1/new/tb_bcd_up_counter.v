`timescale 1ns / 1ps


// testbench
module tb_bcd_up_counter();

reg tb_clk;
reg tb_rst;
reg tb_mode;
wire [3:0] tb_count;

 //bcd_up_counter DUT(.clk(tb_clk),.rst(tb_rst),.BCD_count(tb_count));
 //bcd_down_counter DUT(.clk(tb_clk),.rst(tb_rst),.BCD_count(tb_count));
  mode_sel_bcd_counter DUT(.clk(tb_clk),.rst(tb_rst),.mode(tb_mode),.BCD_count(tb_count));

 
 initial
   begin
    tb_clk = 1'b1;
    forever #5 tb_clk = ~tb_clk;
   end
   
  integer file; 
  
   initial
    begin
    file = $fopen("bcd_up_counter.txt", "w");
    tb_rst <= 1'b1;
    tb_mode <= 1'b0;
     #10  tb_rst <= 1'b0;
     #50 tb_rst <= 1'b0;
     #50 tb_rst <= 1'b1;
     # 40 tb_mode <= 1'b1;
     #10 tb_rst <= 1'b0;
     #50 tb_rst <= 1'b0;
     #10 $fclose(file);
     $fdisplay(file,"Simulation over");
     $finish();
    end
    
    initial
     begin
       //$fmonitor(file,"tb_count = %b",tb_count);
       $fmonitor(file,"tb_rst - %b | tb_mode - %b | tb_count = %b",tb_rst,tb_mode,tb_count);
     end
endmodule
