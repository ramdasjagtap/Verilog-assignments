`timescale 1ns / 1ps


// ALU 
// Addition and subtraction.
module ALU(
 input addsub,
 input [15:0]data_inA,
 input [15:0]data_inM,
 output reg [15:0]data_out
    );
    
    always @(*)
     begin
      if(addsub)  // addsub = 1 -> Addition. 
        begin
          data_out = data_inA + data_inM;
        end
      else if(!addsub)
        begin
          data_out = data_inA - data_inM;      
        end
     end
     
endmodule
