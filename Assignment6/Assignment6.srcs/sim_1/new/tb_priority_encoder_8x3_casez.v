`timescale 1ns / 1ps

module tb_priority_encoder_8x3_casez();
reg [7:0]tb_in;
wire [3:0]tb_encoder_out;

priority_encoder8x3_casez DUT(.in(tb_in),.encoder_out(tb_encoder_out));

integer i;

initial
  begin
 tb_in <= 8'h0;
 #10;
 for(i=0;i<4;i=i+1)
 begin
   tb_in <= 2**i;
   #10;
 end  
 $finish();

end
endmodule