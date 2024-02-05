`timescale 1ns / 1ps

// Full adder using half adder
module full_adder(
input a_in,
input b_in,
input c_in,
output carry_out,
output sum_out
    );
    // wire declaration
    wire carry1,carry2,sum1;
    
    half_adder_gate HA1(.a_in(a_in),.b_in(b_in),.carry_out(carry1),.sum_out(sum1));
    half_adder_gate HA2(.a_in(sum1),.b_in(c_in),.carry_out(carry2),.sum_out(sum_out));
    assign carry_out = carry2 | carry1;
    
endmodule