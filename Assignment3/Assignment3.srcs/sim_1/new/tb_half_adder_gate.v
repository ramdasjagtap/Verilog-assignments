`timescale 1ns / 1ps

//Testbench for Half adder using gate primitives
module tb_half_adder_gate();
reg tb_a_in;
reg tb_b_in;
wire tb_carry_out;
wire tb_sum_out;

// Module instance
half_adder_gate DUT(.a_in(tb_a_in),.b_in(tb_b_in),.carry_out(tb_carry_out),.sum_out(tb_sum_out));


integer i;

// Generating stimulus
initial
begin
tb_a_in <= 1'b0;
tb_b_in <= 1'b0;
#10;

for (i = 0;i<10;i=i+1)
begin
tb_a_in <= $urandom_range(0,2'h3);
tb_b_in <= $urandom_range(0,2'h3);
#10;
end

$finish();
end

initial
begin
 $monitor("Time= %d,tb_a_in = %b, tb_b_in = %b, tb_carry_out = %b, tb_sum_out = %b",$time,tb_a_in,tb_b_in,tb_carry_out,tb_sum_out);
end
endmodule
