`timescale 1ns / 1ps

// Booth multiplier 
module Booth_multiplier(
  input clk,
  input start,
  input [15:0]data_in,
  output [15:0]data_out,
  output done
    );
    
    wire cp_ldA,cp_clrA,cp_sftA,cp_ldQ,cp_clrQ,cp_sftQ,cp_ldM;
    wire cp_decr,cp_ldcnt,cp_addsub,cp_qm1,cp_eqz,cp_q0,cp_clrff;
    
    booth_datapath BD(
     .clk(clk),
     .ldA(cp_ldA),
     .clrA(cp_clrA),
     .sftA(cp_sftA),
     .ldQ(cp_ldQ),
     .clrQ(cp_clrQ),
     .sftQ(cp_sftQ),
     .ldM(cp_ldM),
     .clrff(cp_clrff),
     .addsub(cp_addsub),
     .data_in(data_in),
     .data_out(data_out),
     .qm1(cp_qm1),
     .eqz(cp_eqz),
     .q0(cp_q0)
    );
    
    booth_controller BC(
     .clk(clk),
     .start(start),
     .qm1(cp_qm1),
     .q0(cp_q0),
     .eqz(cp_eqz),
     .ldA(cp_ldA),
     .clrA(cp_clrA),
     .sftA(cp_sftA),
     .ldQ(cp_ldQ),
     .clrQ(cp_clrQ),
     .sftQ(cp_sftQ),
     .ldM(cp_ldM),
     .clrff(cp_clrff),
     .addsub(cp_addsub),
     .done(done),
     .decr(cp_decr),
     .ldcnt(cp_ldcnt)
    );
    
endmodule
