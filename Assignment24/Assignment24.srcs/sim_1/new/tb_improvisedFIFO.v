`timescale 1ns / 1ps

module tb_improvisedFIFO();
reg tb_clk;
reg tb_rst;
reg tb_wr_en;
reg tb_rd_en;
reg [7:0]tb_din;
wire [7:0]tb_dout;
wire tb_full;
wire tb_empty;
wire tb_almost_full;
wire tb_almost_empty;

improvisedFIFO #(8,16,4)DUT(.clk(tb_clk),.rst(tb_rst),.wr_en(tb_wr_en),.rd_en(tb_rd_en),.data_in(tb_din),.data_out(tb_dout)
,.full(tb_full),.empty(tb_empty),.almost_full(tb_almost_full),.almost_empty(tb_almost_empty));

always #5 tb_clk = ~tb_clk;

integer i;
integer file;

initial
  begin
   file = $fopen("improvisedFIFO.txt","w");
   tb_rst <= 1'b1;
   tb_clk <= 1'b0;
   tb_wr_en <= 1'b0;
   tb_rd_en <= 1'b0;
   tb_din <= 'hAA;
   #7;
   tb_rst <= 1'b0;
   #7;
   tb_wr_en <= 1'b1;
   tb_rd_en <= 1'b0;
   for(i=0;i<32;i=i+1)
     begin
       tb_din <= $urandom_range(0,8'hFF);
       @(negedge tb_clk);
       @(negedge tb_clk);
     end
     
     tb_rst <= 1'b0;
     tb_wr_en <= 1'b1;
     tb_rd_en <= 1'b1;
     for(i=0;i<32;i=i+1)
      begin
       tb_din <= $urandom_range(0,8'hFF);
       @(negedge tb_clk);
       @(negedge tb_clk);
     end
     #50;
   
     $fclose(file);
     $fdisplay(file,"Simulation Over!!");
     $finish();
  end
  
  initial
    begin
     $fmonitor(file,"Time -%d | tb_wr_en - %b | tb_rd_en - %b | tb_din - %d ",$time,tb_wr_en,tb_rd_en,tb_din);
    end
endmodule
