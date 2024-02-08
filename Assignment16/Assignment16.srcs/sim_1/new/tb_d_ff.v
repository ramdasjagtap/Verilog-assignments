`timescale 1ns / 1ps

// 
module tb_d_ff();
reg tb_clk;
reg tb_d;
wire tb_q;

d_ff DUT(tb_q,tb_clk,tb_d);

always #5 tb_clk = ~tb_clk;
  
  integer i;
  integer file;
  initial
   begin
    file = $fopen("d_ff.txt","w");
    tb_clk = 1'b0;
    tb_d = 1'b0;
    #10;
    for(i=0;i<16;i=i+1)
     begin
      repeat(10) @(posedge tb_clk);
      tb_d <= $random() % 2;
     end
     #20;
     $fclose(file);
     $fdisplay(file,"Simulation Over!!");
     $finish();
   end
   
   initial
    begin
     $fmonitor(file,"Time - %d | tb_clk - %b | tb_d - %b | tb_q - %b ",$time,tb_clk,tb_d,tb_q);
    end
endmodule
