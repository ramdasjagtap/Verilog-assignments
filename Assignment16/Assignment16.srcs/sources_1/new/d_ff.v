`timescale 1ns / 1ps

//sequential primitive
// 1) level triggered  || 2) edge triggered


primitive d_ff(q,clk,d);

 output reg q;
 input clk,d;
 
 table
    // clk | d | q | q(n+1)
    
    /* //rising edge of clock
    (01) 0 : ? : 0;
    (01) 1 : ? : 1;
    (0?) 1 : 1 : 1;
    (0?) 0 : 0 : 0;
    */
    r 0 : ? : 0;
    r 1 : ? : 1;
    (0?) 1 : 1 : 1;
    (0?) 0 : 0 : 0;
    
    // ignore falling edge of clock;
    (?0) ? : ? : -;
    
    //steady clock state
    ? (??): ? : -;
 endtable
 
endprimitive
/*
module d_ff(

    );
endmodule
*/