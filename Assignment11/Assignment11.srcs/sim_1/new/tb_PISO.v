`timescale 1ns / 1ps


// parallel in serial out
module tb_PISO();
reg tb_clk;
reg tb_rst;
reg tb_load;
reg [3:0] tb_parallel_i;
wire tb_serial_o;


PISO_d DUT(.clk(tb_clk),.rst(tb_rst),.load(tb_load),.parallel_i(tb_parallel_i),.serial_o(tb_serial_o));

always 
 begin
   tb_clk = 1'b1;
   #10;
   tb_clk = 1'b0;
   #10;
 end
 
 integer i;
  initial
   begin
    tb_rst <= 1'b1;
    tb_parallel_i <= 4'h0;
    tb_load <= 1'b0;
    @(posedge tb_clk);
    tb_rst <= 1'b0;
    tb_load <= 1'b1;
    tb_parallel_i <= 4'h8;
    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);
    tb_load <= 1'b0;
    @(posedge tb_clk);
    
    
    //  use of fork and join
     fork
    for(i=0;i<32;i=i+1)
     begin
      tb_parallel_i <= $urandom_range(4'h0,4'hF);
      @(posedge tb_clk);
      @(posedge tb_clk);
     end
     join
     //*/
     $finish();
   end
endmodule
