`timescale 1ns / 1ps


module tb_decoder_3x8_case();
reg [2:0] tb_in;
wire [7:0] tb_dec_out_case;

decoder_3x8_case DUT(.in(tb_in),.dec_out_case(tb_dec_out_case));

integer i;
initial
 begin
  tb_in <= 3'b000;
  #10;
  for(i=0;i<32;i=i+1)
   begin
    tb_in <= $urandom_range(0,3'h7);
    #10;
  end

  $finish();
end

initial
  begin
 $monitor("Time -%d,tb_in -%b,tb_dec_out_case -%b",$time,tb_in,tb_dec_out_case); 
 //end  
end
endmodule