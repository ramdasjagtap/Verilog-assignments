`timescale 1ns / 1ps


module tb_decoder_3x8_casez();
reg [2:0] tb_in;
reg tb_en;
wire [7:0] tb_dec_out_casez;

decoder_3x8_casez DUT(.in(tb_in),.en(tb_en),.dec_out_casez(tb_dec_out_casez));

integer i;
initial
 begin
  tb_in <= 3'b000;
  tb_en <= 3'b0;
  #10;
  for(i=0;i<32;i=i+1)
   begin
    tb_in <= $urandom_range(0,3'h7);
    tb_en <= $random % 2;
    #10;
  end

  $finish();
end

initial
  begin
 $monitor("Time -%d,tb_in -%b,tb_dec_out_casez -%b",$time,tb_in,tb_dec_out_casez); 
 //end  
end
endmodule