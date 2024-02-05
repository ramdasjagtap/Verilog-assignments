`timescale 1ns / 1ps

module tb_mod_N_updown_counter();

parameter N = 10;
parameter  WIDTH = 4;
reg [3:0] b_value = 7;

reg tb_clk;
reg tb_rst;
reg tb_mode;
reg tb_load;
wire [WIDTH-1:0] tb_count;

mod_load_counter #(N,WIDTH) DUT(.clk(tb_clk),.arst(tb_rst),.load(tb_load),.value(tb_value),.mode(tb_mode),.count(tb_count));

initial 
  begin
   tb_clk = 1'b1;
   forever
    #5 tb_clk = ~tb_clk;
  end
  
  
  integer file;
  initial
   begin
     file = $fopen("updown_counter.txt","w");
     tb_rst <= 1'b1;
     tb_mode <= 1'b0;
     tb_load <= 1'b0;
     #10;
     tb_rst <= 1'b0;
     tb_load <= 1'b0;
     #30;
     tb_rst <= 1'b0;
     #50 tb_mode <= 1'b1;
     tb_load <= 1'b1;
     tb_rst <= 1'b0;
     #60
     tb_load <= 1'b0;
     #100;
     tb_rst <= 1'b0;
     #120;
     tb_rst <= 1'b0;
     #200;
     tb_rst <= 1'b0;
     #300;
     $fclose(file);
     #10 $fdisplay("Simulation over!!");
     $finish();
   end
   
   
   initial
     begin
        $fmonitor(file,"tb_rst - %b | tb_mode - %b | tb_count - %d",tb_rst,tb_mode,tb_count);
     end
endmodule