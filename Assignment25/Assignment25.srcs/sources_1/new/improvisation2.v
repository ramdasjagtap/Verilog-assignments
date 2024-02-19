`timescale 1ns / 1ps

//GCD top module
module improvisation2(
  input clk,
  input start,
  input [15:0] data_in,
  output [15:0] data_out,
  output done
    );
    
    
    wire cp_ldA,cp_ldB,cp_sel1,cp_sel2,cp_sel_in; 
    wire cp_eq,cp_gt,cp_lt;
    
    datapathGCD DP(
     .clk(clk),
     .ldA(cp_ldA),
     .ldB(cp_ldB),
     .sel1(cp_sel1),
     .sel2(cp_sel2),
     .sel_in(cp_sel_in),
     .data_in(data_in),
     .data_out(data_out),
     .gt(cp_gt),
     .lt(cp_lt),
     .eq(cp_eq)
    );
    
     controllerGCD CP(
     .clk(clk),
     .start(start),
     .lt(cp_lt),
     .gt(cp_gt),
     .eq(cp_eq),
     .ldA(cp_ldA),
     .ldB(cp_ldB),
     .sel1(cp_sel1),
     .sel2(cp_sel2),
     .sel_in(cp_sel_in),
     .done(done)
     );
     
endmodule
