`timescale 1ns / 1ps

// Multiplication by repeated addition.
module improvisation1(
  input clk,
  input arst_n,
  input [15:0]data_in,
  output [31:0]data_out,
  output done
    );
     
     
     wire cp_eqz,cp_ldA,cp_ldB,cp_ldP,cp_decB,cp_clrP;
     
     controller1 CP(
     .clk(clk),
     .arst_n(arst_n),
     .eqz(cp_eqz),
     .ldA(cp_ldA),
     .ldP(cp_ldP),
     .ldB(cp_ldB),
     .clrP(cp_clrP),
     .decB(cp_decB),
     .done(done)
     );
     
     datapath1 DP(
       .clk(clk),
       .data_in(data_in),
       .ldA(cp_ldA),
       .ldB(cp_ldB),
       .ldP(cp_ldP),
       .clrP(cp_clrP),
       .decB(cp_decB),
       .data_out(data_out),
       .eqz(cp_eqz)
     );
     
     
endmodule
