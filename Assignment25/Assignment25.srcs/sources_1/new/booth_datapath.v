`timescale 1ns / 1ps

// data path for booth multiplier.
module booth_datapath(
 input clk,
 input ldA,clrA,sftA,
 input ldQ,clrQ,sftQ,
 input ldM,clrff,
 input decr,ldcnt,
 input addsub,
 input [15:0] data_in,
 output qm1,eqz,q0,
 output [31:0]data_out
    );
    
    wire [15:0] A,M,Q,Z;
    wire [4:0]count;
   
    shiftreg ARS(.clk(clk),.data_out(A),.data_in(Z),.ld(ldA),.clr(clrA),.sft(sftA),.serial_i(A[15]));
    shiftreg QRS(.clk(clk),.data_out(Q),.data_in(data_in),.ld(ldQ),.clr(clrQ),.sft(sftQ),.serial_i(A[0]));
    d_ff QM(.clk(clk),.clr(clrff),.d(Q[0]),.q(qm1));
    PIPO MR(.clk(clk),.data_in(data_in),.data_out(M),.ld(ldM));
    ALU AS(.addsub(addsub),.data_inA(A),.data_inM(M),.data_out(Z));
    counter CN(.clk(clk),.decr(decr),.ldcnt(ldcnt),.data_out(count));
    
    assign eqz = !(&count);
    assign q0 = A[0];
    assign data_out = {A,Z};
    
endmodule
