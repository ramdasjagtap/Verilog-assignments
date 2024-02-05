`timescale 1ns / 1ps

//testbench for 4 bit adder
// ripple carry adder
module tb_full_adder_4bit();
reg [3:0]tb_a_in;
reg [3:0]tb_b_in;
reg tb_c_in;
wire tb_carry_out;
wire [3:0]tb_sum_out;

full_adder_4bit DUT(.a_in(tb_a_in),.b_in(tb_b_in),.c_in(tb_c_in),.carry_out(tb_carry_out),.sum_out(tb_sum_out));

integer i;
initial
begin
tb_a_in <= 4'h0;
tb_b_in <= 4'h0;
tb_c_in <= 1'b0;
#10;
for(i = 0;i<=32 ;i=i+1)
begin
tb_a_in <= $urandom_range(0,4'hF);
tb_b_in <= $urandom_range(0,4'hF);
tb_c_in <= $urandom_range(0,1'b1);
#10;
end

$finish();
end


initial
begin
$monitor("Time = %d, a_in = %b, b_in = %b, C_in = %b, carry_out = %b ,sum_out = %b",$time,tb_a_in,tb_b_in,tb_c_in,tb_carry_out,tb_sum_out);
$display("Simulation Finished!!");
end


endmodule
