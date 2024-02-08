`timescale 1ns / 1ps


module tb_mux_4x1();

reg tb_sel_0,tb_sel_1;
reg tb_in_0,tb_in_1,tb_in_2,tb_in_3;
wire tb_mux_out;


integer  i;
integer file;

mux_4x1 DUT(tb_mux_out,tb_sel_1,tb_sel_0,tb_in_0,tb_in_1,tb_in_2,tb_in_3);

initial
 begin
  file = $fopen("mux_4x1.txt","w");
  tb_in_0 <= 1'b0;
  tb_in_1 <= 1'b0;
  tb_in_2 <= 1'b0;
  tb_in_3 <= 1'b0;
  tb_sel_0 <= 1'b0;
  tb_sel_1 <= 1'b0;
  #10; 
  /*
  tb_sel_0 <= 1'b1;
  tb_sel_1 <= 1'b0;
  #10
  tb_sel_0 <= 1'b0;
  tb_sel_1 <= 1'b1;
  #10
  tb_sel_0 <= 1'b1;
  tb_sel_1 <= 1'b1;
  #10
  tb_sel_0 <= 1'b0;
  tb_sel_1 <= 1'b0;
  #10
   tb_in_0 <= 1'b1;
  tb_in_1 <= 1'b1;
  tb_in_2 <= 1'b1;
  tb_in_3 <= 1'b1;
  tb_sel_0 <= 1'b0;
  tb_sel_1 <= 1'b0;
  #10; 
  tb_sel_0 <= 1'b1;
  tb_sel_1 <= 1'b0;
  #10
  tb_sel_0 <= 1'b0;
  tb_sel_1 <= 1'b1;
  #10
  tb_sel_0 <= 1'b1;
  tb_sel_1 <= 1'b1;
  #10
  tb_sel_0 <= 1'b0;
  tb_sel_1 <= 1'b0;
  #10
  */
  
  for(i=0;i<16;i=i+1)
   begin
     tb_sel_1 = $urandom() % 2;
     tb_sel_0 = $urandom() % 2;
     tb_in_0 = $urandom() % 2;
     tb_in_1 = $urandom() % 2;
     tb_in_2 = $urandom() % 2;
     tb_in_3 = $urandom() % 2;
     #10;
   end
   $fclose(file);
   #10 $fdisplay(file,"Simulation Over!!");
  $finish();
 end
 
 initial
  begin
    $fmonitor(file,"Time - %d | tb_sel_0 - %b | tb_sel-1 %b | tb_in_0 - %b | tb_in_1 - %b | tb_in_2 - %b | tb_in_3 - %b",$time,tb_sel0,tb_sel_1,tb_in_0,tb_in_1,tb_in_2,tb_in_3);
  end
endmodule

