`timescale 1ns / 1ps

// testbench for full adder
module tb_full_adder();
reg tb_a_in;
reg tb_b_in;
reg tb_c_in;
wire tb_sum_out;
wire tb_carry_out;

// module instance
full_adder DUT(.a_in(tb_a_in),.b_in(tb_b_in),.c_in(tb_c_in),.sum_out(tb_sum_out),.carry_out(tb_carry_out));


integer i;

// Generating stimulus
initial
begin
for(i=0;i<8;i=i+1)
begin
  {tb_a_in,tb_b_in,tb_c_in} = i;
  #10;
end
$finish();
end


// Monitor function
initial
begin
 $monitor("Time= %d,a_in = %b, b_in = %b,c_in = %b carry = %b, sum = %b",$time,tb_a_in,tb_b_in,tb_c_in,tb_carry_out,tb_sum_out);
end

endmodule
