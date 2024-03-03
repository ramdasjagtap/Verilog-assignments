`timescale 1ns / 1ps

// test cases.
module tb_Booth_multiplier();

reg tb_clk;
reg tb_start;
reg [15:0] tb_data_in;
wire [15:0] tb_data_out;
wire tb_done;

Booth_multiplier DUT(
 .clk(tb_clk),
 .start(tb_start),
 .data_in(tb_data_in),
 .data_out(tb_data_out),
 .done(tb_done)
);

always #5 tb_clk = ~tb_clk;

initial
  begin
    tb_clk <= 1'b0;
    tb_start <= 1'b0;
    #10;
    tb_start <= 1'b1;
    #10;
    tb_data_in <= 'h04;
    #20;
    tb_data_in <= 'h05;
    #100;
    $finish();
  end
  
  
  initial
   begin
     $monitor("Time - %d | tb_start - %b | tb_data_in - %d | tb_data_out -%d |tb_done - %d",$time,tb_start,tb_data_in,tb_data_out,tb_done);
   end
   
endmodule
