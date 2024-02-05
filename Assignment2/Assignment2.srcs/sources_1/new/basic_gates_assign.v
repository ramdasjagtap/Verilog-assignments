`timescale 1ns / 1ps

//Basic gates using assign

module basic_gates_assign(
input a_in,b_in,
output and_out,
output or_out,
output xor_out,
output anot_out,
output bnot_out,
output nand_out,
output nor_out,
output xnor_out
    );
    //Basic gate implementation using assign keyword

    //AND gate
    assign and_out = a_in &  b_in;
    //OR gate
    assign or_out = a_in | b_in;
    //XOR gate
    assign xor_out = a_in ^ b_in;
    //NOT gate
    assign anot_out = !a_in;
    assign bnot_out = !b_in;
    //NAND gate
    assign nand_out = !(a_in & b_in);
    //NOR gate
    assign nor_out = !(a_in & b_in);
    //XNOR gate
    assign xnor_out = !(a_in ^ b_in);
endmodule