`timescale 1ns / 1ps

//carry look ahead adder
// Carry look ahead adder
// G(i) & P(i)
// P(i) = A(i) ^ B(i);
// G(i) = A(i) & B(i);
// C(i+1) = G(i) | { P(i) & C(i) }; 
// sum[i] = P(i) ^ C(i);
module carry_look_ahead_adder(
input [3:0]a_in,
input [3:0]b_in,
input c_in,
output carry_out,
output [3:0]sum_out
);

wire P0,P1,P2,P3;
wire G0,G1,G2,G3;
wire C0,C1,C2,C3;

//carry propogation
assign P0 = a_in[0] ^ b_in[0];
assign P1 = a_in[1] ^ b_in[1];
assign P2 = a_in[2] ^ b_in[2];
assign P3 = a_in[3] ^ b_in[3];

// carry generation
assign G0 = a_in[0] & b_in[0];
assign G1 = a_in[1] & b_in[1];
assign G2 = a_in[2] & b_in[2];
assign G3 = a_in[3] & b_in[3];

// carry out
assign C0 = c_in;
assign C1 = G0 | ( P0 & c_in); 
assign C2 = G1 | ( P1 & G0) | (P1 & P0 & c_in);
assign C3 = G2 | ( P2 & G1) | (P2 & P1 & G0) | (P2 & P1 & P0 & c_in);
assign carry_out = G3 | ( P3 & G2) | (P3 & P2 & G1) | (P3 & P2 & P1 & G0) | (P3 & P2 & P1 & P0 & c_in);

// sum
assign sum_out[0] = P0 ^ C0;
assign sum_out[1] = P1 ^ C1;
assign sum_out[2] = P2 ^ C2;
assign sum_out[3] = P3 ^ C3;

endmodule