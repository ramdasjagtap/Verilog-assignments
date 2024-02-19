`timescale 1ns / 1ps

// testbench
module tb_GCD();
 
 reg tb_clk;
 reg tb_start;
 reg [15:0] tb_data_in;
 wire tb_done;
 wire [15:0] tb_data_out;
 
 improvisation2 DUT(
 .clk(tb_clk),
 .start(tb_start),
 .data_in(tb_data_in),
 .done(tb_done),
 .data_out(tb_data_out)
 );
 
 always #5 tb_clk = ~tb_clk;
 
 
 initial
   begin
   // first test
    tb_clk <= 1'b0;
    tb_start <= 1'b0;
    #10;
    tb_start <= 1'b1;
    tb_data_in <= 'd65;
    #10;
    tb_start <= 1'b0;
    tb_data_in <= 'd26;
    #50;
    $finish();
   end
   
   
   initial
     begin
       $monitor("Time - %d | tb_start - %d | tb_data_in - %d | tb_data_out -%d",$time,tb_start,tb_data_in,tb_data_out);
     end
     
endmodule
