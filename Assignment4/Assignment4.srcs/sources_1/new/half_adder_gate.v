`timescale 1ns / 1ps

// Half adder using Gate primitives
module half_adder_gate(
input a_in,
input b_in,
output carry_out,
output sum_out
    );
    
    // Sum
    xor XOR(sum_out,a_in,b_in);
    
    // Carry
    and AND(carry_out,a_in,b_in);
    
endmodule