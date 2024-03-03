`timescale 1ns / 1ps

// 
module tb_multiplier();
  reg [15:0] data_in;
  reg rst, start, clk;
  wire [15:0] data_out;
  wire done;
  
  multiplier DUT(.clk(clk),.rst(rst), .start(start),.data_in(data_in), .data_out(data_out), .done(done));
  
 always
  begin
    #5 clk = ~clk;
  end
  
  initial
  begin
  start = 1'b0;
  rst = 1'b0;
  clk = 1'b0;
  #13 rst = 1'b1;
  #20 rst = 1'b0;
  #13 start = 1'b1;
  #20 start = 1'b0;
  data_in = 5'b10001;
  #20 data_in = 5'b01001;
  #400 ;

  start = 1'b0;
  rst = 1'b0;
  clk = 1'b0;
  #13 rst = 1'b1;
  #20 rst = 1'b0;
  #13 start = 1'b1;
  #20 start = 1'b0;
  data_in = 5'b01001;
  #20 data_in = 5'b10001;
  #400 ;

    repeat (5)
      begin
         start = 1'b0;
         rst = 1'b0;
         clk = 1'b0;
         #13 rst = 1'b1;
         #20 rst = 1'b0;
         #13 start = 1'b1;
         #20 start = 1'b0;
         data_in = $random % 16;
         #20 data_in = $random % 16;
         #400 ;
      end
      #300 $finish;
  end
  
endmodule
