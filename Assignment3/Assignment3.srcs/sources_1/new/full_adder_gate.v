`timescale 1ns / 1ps

// Full adder using Gate primitives
module full_adder_gate(
input a_in,
input b_in,
input c_in,
output carry_out,
output sum_out
    );
    
    // wire declaration
    wire s1,c1,c2;
    
    //sum
    xor XOR0(s1,a_in,b_in);
    xor XOR1(sum_out,s1,c_in);
    
    //carry
    and AND0(c1,a_in,b_in);
    and AND1(c2,s1,c_in);
    or OR(carry_out,c1,c2);
endmodule
