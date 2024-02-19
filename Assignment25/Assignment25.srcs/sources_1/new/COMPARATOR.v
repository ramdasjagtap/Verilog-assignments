`timescale 1ns / 1ps

// comparator 
module COMPARATOR(
  input [15:0] data_in_comp,
  output  eqz
);

 assign eqz = (data_in_comp == 0);
 
endmodule
