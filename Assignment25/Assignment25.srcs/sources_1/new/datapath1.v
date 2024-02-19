`timescale 1ns / 1ps

//datapath of multiplication by repeated additi
module datapath1(
  input clk,
  input [15:0]data_in,
  input ldA,ldB,ldP,clrP,decB,
  output [31:0]data_out,
  output eqz
    );
     
     wire [15:0]A_out;
     wire [31:0]ADD_out;
     wire [15:0]P_out;
     wire [15:0]B_out;
     wire COMP_out;
         
     PIPO1 A(.clk(clk),.ldA(ldA),.data_in_A(data_in),.data_out_A(A_out));
     PIPO2 P(.clk(clk),.ldP(ldP),.clrP(clrP),.data_in_P(ADD_out),.data_out_P(P_out));
     ADDER ADD(.data_inX(A_out),.data_inY(P_out),.data_out_ADD(ADD_out));
     CNTR B(.clk(clk),.ldB(ldB),.decB(decB),.data_in_B(data_in),.data_out_B(B_out));
     COMPARATOR COMP(.data_in_comp(B_out),.eqz(COMP_out));
     
     assign data_out = ADD_out;
     assign eqz = COMP_out;
     
endmodule
