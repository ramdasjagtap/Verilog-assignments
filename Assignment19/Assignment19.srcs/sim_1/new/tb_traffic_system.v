`timescale 1ns / 1ps

// Traffic system
module tb_traffic_system();

reg tb_clk;
reg tb_rst;
reg tb_C;
//reg tb_TS;   // timer short
//reg tb_TL;   // timer long
wire tb_HG,tb_HY,tb_HR;
wire tb_FG,tb_FY,tb_FR;
wire tb_ST;

// module instance
traffic_system DUT(.clk(tb_clk),.rst(tb_rst),.C(tb_C),.HG(tb_HG),.HY(tb_HY),.HR(tb_HR),.FR(tb_FR),.FY(tb_FY),.FG(tb_FG),.ST(tb_ST));

always #5 tb_clk = !tb_clk;

integer i;
initial
  begin
   tb_rst <= 1'b1;
   tb_clk <= 1'b0;
   tb_C <= 1'b0;
   #10;
   tb_rst <= 1'b0;
   #30;
   tb_C <= 1'b1;
   #30;
   tb_C <= 1'b0;
   #100;
   tb_C <= 1'b0;
   #200;
   tb_C <= 1'b1;
   #10;
   tb_C <= 1'b0;
   #20;
   tb_C <= 1'b1;
   #40;
   
   for(i=0;i<512;i=i+1)
     begin
      tb_C <= $urandom_range(0,1);
      @(negedge tb_clk);
     end
     
   $finish();
  end
endmodule
