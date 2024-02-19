`timescale 1ns / 1ps

// datapath of GCD
module datapathGCD(
 input clk,
 input ldA,ldB,
 input sel1,sel2,sel_in,
 input [15:0]data_in,
 output [15:0]data_out,
 output gt,lt,eq
    );
    
   wire [15:0] Aout,Bout,X,Y,Subout,Bus;
    
   PIPO A(.clk(clk),.ld(ldA),.data_in(Bus),.data_out(Aout));
   PIPO B(.clk(clk),.ld(ldB),.data_in(Bus),.data_out(Bout));
   MUX_2x1 MUX1(.inA(Aout),.inB(Bout),.sel(sel1),.mux_out(X)); 
   MUX_2x1 MUX2(.inA(Aout),.inB(Bout),.sel(sel2),.mux_out(Y));
   MUX_2x1 MUX3(.inA(Subout),.inB(data_in),.sel(sel_in),.mux_out(Bus)); 
   SUB SB(.sub_out(Subout),.inA(X),.inB(Y));
   COMPARE COMP(.lt(lt),.gt(gt),.eq(eq),.Aout(Aout),.Bout(Bout)); 

assign data_out = Subout;

endmodule
