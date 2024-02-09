`timescale 1ns / 1ps


module tb_data_path();
 
 reg tb_clk;
 reg tb_en;
 reg [3:0]tb_A;
 reg [3:0]tb_B;
 reg tb_clr;
 wire tb_done;
 wire [7:0]tb_data_path_out;
 
 datapath DUT(.clk(tb_clk),.en(tb_en),.A(tb_A),.B(tb_B),.clr(tb_clr),.done(tb_done),.data_path_out(tb_data_path_out));
 
 always #5 tb_clk = ~tb_clk;
 
 initial
  begin
   tb_en <= 1'b0;
   tb_clk <= 1'b0;
   tb_A <= 4'h4;
   tb_B <= 4'hA;
   tb_clr <= 1'b0;
   #10;
   tb_en <= 1'b1;
   tb_clr <= 1'b0;
   #20
   tb_clr <= 1'b1;
   #50;
  end
endmodule
