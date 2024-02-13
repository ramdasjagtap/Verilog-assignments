`timescale 1ns / 1ps

// test bench
module tb_FIFO16x8();

reg tb_clk;
reg tb_rst;
reg tb_wr_en;
reg tb_rd_en;
reg [7:0]tb_din;
wire [7:0]tb_dout;
wire tb_full;
wire tb_empty;
//wire tb_overflow;

FIFO16x8 DUT(.clk(tb_clk),.rst(tb_rst),.wr_en(tb_wr_en),.rd_en(tb_rd_en),.din(tb_din),.dout(tb_dout),.full(tb_full),.empty(tb_empty));

always #5 tb_clk = ~tb_clk;

integer i;
integer file;
initial
  begin
    
    file = $fopen("FIFO16x8.txt","w");
   tb_rst <= 1'b1;
   tb_clk <= 1'b0;
   tb_wr_en <= 1'b0;
   tb_rd_en <= 1'b0;
   tb_din <= 0;
   #10;
   tb_rst <= 1'b0;
   tb_wr_en <= 1'b1;
   tb_rd_en <= 1'b1;
   for(i=0;i<32;i=i+1)
     begin
       tb_din <= $urandom_range(0,1);
       @(negedge tb_clk);
       @(negedge tb_clk);
     end
     #100;
     $fclose(file);
     $fdisplay(file,"Simulation Over!!");
     $finish();
  end
  
  initial
    begin
     $fmonitor(file,"Time -%d | tb_wr_en - %b | tb_rd_en - %b | tb_din - %d ",$time,tb_wr_en,tb_rd_en,tb_din);
    end
endmodule
