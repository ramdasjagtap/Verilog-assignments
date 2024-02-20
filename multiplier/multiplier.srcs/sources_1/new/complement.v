`timescale 1ns / 1ps

// complement
module complement(
 input [15:0]data_in,
 output [15:0]data_out
    );
    
    wire [15:0] temp;
    assign temp = ~data_in;
    
    assign data_out = temp + 1;
     
endmodule
