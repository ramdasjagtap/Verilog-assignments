`timescale 1ns / 1ps

// 4 bit full adder using full adder
module full_adder_4bit(
input [3:0]a_in,
input [3:0]b_in,
input c_in,
output carry_out,
output [3:0]sum_out
    );
    
    wire c1,c2,c3;
    full_adder FA0(.a_in(a_in[0]),.b_in(b_in[0]),.c_in(c_in),.carry_out(c1),.sum_out(sum_out[0]));
    full_adder FA1(.a_in(a_in[1]),.b_in(b_in[1]),.c_in(c1),.carry_out(c2),.sum_out(sum_out[1]));
    full_adder FA2(.a_in(a_in[2]),.b_in(b_in[2]),.c_in(c2),.carry_out(c3),.sum_out(sum_out[2]));
    full_adder FA3(.a_in(a_in[3]),.b_in(b_in[3]),.c_in(c3),.carry_out(carry_out),.sum_out(sum_out[3]));

endmodule