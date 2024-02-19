`timescale 1ns / 1ps


// comparator 
module COMPARE(
 input [15:0]Aout,Bout,
 output lt,gt,eq
    );
    
    assign lt = (Aout < Bout);
    assign gt = (Aout > Bout);
    assign eq = (Aout == Bout);
    
endmodule
