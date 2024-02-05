`timescale 1ns / 1ps

module tb_decoder_2x4_casex();
reg [1:0]tb_in;
reg tb_en;
wire [3:0]tb_dec_out_casex;

// module instance
decoder_2x4_casex DUT(.in(tb_in),.en(tb_en),.dec_out_casex(tb_dec_out_casex));

integer i;
initial
 begin
  tb_in <= 2'b00;
  tb_en <= 1'b0;
  #10;
  for(i=0;i<32;i=i+1)
   begin
    tb_in <= $urandom_range(0,2'h3);
    tb_en <= $random % 2;
    #10;
  end

  $finish();
end

initial
  begin
 $monitor("Time -%d,tb_in -%b,eb- %b, tb_dec_out_case -%b",$time,tb_in,tb_en,tb_dec_out_casex); 
 //end  
end
endmodule
