`timescale 1ns / 1ps

//testbech for decoder 2:4
module tb_decoder_2x4_case();
reg [1:0] tb_in;
wire [3:0] tb_dec_out_case;

// module instance
decoder_2x4_case DUT(.in(tb_in),.dec_out_case(tb_dec_out_case));

integer i;
initial
 begin
  tb_in <= 2'b00;
  #10;
  for(i=0;i<32;i=i+1)
   begin
    tb_in <= $urandom_range(0,2'h3);
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