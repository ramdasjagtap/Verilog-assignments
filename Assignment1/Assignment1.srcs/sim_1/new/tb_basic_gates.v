`timescale 1ns / 1ps

//Testbench for basic gates.
module tb_basic_gates();

reg tb_a_in;
reg tb_b_in;
wire tb_and_out;
wire tb_or_out;
wire xtb_or_out;
wire tb_anot_out;
wire tb_bnot_out;
wire tb_xnor_out;
wire tb_nand_out;
wire tb_nor_out;

basic_gates DUT(tb_a_in,tb_b_in,tb_and_out,tb_or_out,tb_xor_out,tb_anot_out,tb_bnot_out,tb_xnor_out,tb_nand_out,tb_nor_out);

initial
begin
tb_a_in = 1'b0;
tb_b_in = 1'b0;
#10;
tb_a_in = 1'b0;
tb_b_in = 1'b1;
#10;
tb_a_in = 1'b1;
tb_b_in = 1'b0;
#10;
tb_a_in = 1'b1;
tb_b_in = 1'b1;
#10;
$finish();
end


initial
begin
$monitor ("T=%t |tb_a_in=%b |tb_b_in=%b |tb_and_out=%b |tb_or_out=%b |tb_xor_out=%b | tb_anot_out=%b |tb_bnot_out=%b |tb_xtb_nor_out=%b | tb_nand_out=%b |nor_out=%b", $time, tb_a_in, tb_b_in, tb_and_out, tb_or_out, tb_xor_out,tb_anot_out,tb_bnot_out,tb_xnor_out,tb_nand_out,tb_nor_out);  

end
endmodule
