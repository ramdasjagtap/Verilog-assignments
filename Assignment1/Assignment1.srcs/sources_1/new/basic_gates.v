`timescale 1ns / 1ps

//Basic gates using Gate primitives.

module basic_gates(
input a_in,
input b_in,
output and_out,
output or_out,
output xor_out,
output anot_out,
output bnot_out,
output xnor_out,
output nand_out,
output nor_out
    );
    
    and AND(and_out,a_in,b_in);
    or OR(or_out,a_in,b_in);
    xor XOR(xor_out,a_in,b_in);
    not NOTA(anot_out,a_in);
    not NOTB(bnot_out,b_in);
    xnor XNOR(xnor_out,a_in,b_in);
    nand NAND(nand_out,a_in,b_in);
    nor NOR(nor_out,a_in,b_in);

endmodule