`timescale 1ns / 1ps


// Serial input serial output 
module tb_SIPO();
reg tb_clk;
reg tb_rst;
reg tb_serial_i;
wire [3:0]tb_parallel_o;


// module instance
SIPO_extrawork DUT(.clk(tb_clk),.rst(tb_rst),.serial_i(tb_serial_i),.parallel_o(tb_parallel_o));

// clock
always 
 begin
  tb_clk =  1'b1;
  #10;
  tb_clk = 1'b0;
  #10;
 end
 
 // stimulus
 integer i;
 initial
  begin
   tb_rst <= 1'b1;
   tb_serial_i <= 1'b0;
   @(posedge tb_clk);
    tb_rst <= 1'b0;
    @(posedge tb_clk);
    
    for(i=0;i<16;i=i+1)
     begin
       tb_serial_i <= $urandom() % 2;
       @(posedge tb_clk);
     end
     
     
     fork 
      tb_serial_i = #15 1'b0;
      tb_serial_i = #5 1'b1;
      tb_serial_i = #20 1'b1; 
      tb_serial_i = #13 tb_serial_i ^ 1'b1;
     join
     
     $finish();
  end

endmodule
