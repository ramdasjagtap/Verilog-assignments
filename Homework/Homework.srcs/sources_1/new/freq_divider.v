`timescale 1ns / 1ps


// asynchronous counter
// frequency divider
module freq_divider(
 input clk,
 input arst,
 output q
    );
   
   // input to d flip flop
   wire [3:0]din;
   
   // output of d flip flop
   wire [3:0]clkdiv;
   
   // module instance for 0th ff.
   d_ff DFF0(.clk(clk),.arst(arst),.d(din[0]),.q(clkdiv[0]));
   
   
   // generating next 3 ff of frequcency divider.
   genvar i;
   generate 
     for(i=1;i<4;i=i+1)
      begin
        d_ff u0(.clk(clkdiv[i-1]),.arst(arst),.d(din[i]),.q(clkdiv[i]));
      end
   endgenerate;
   
   // input 
   assign din = ~clkdiv;
   
   //output 
   assign q = clkdiv[3];
   
endmodule