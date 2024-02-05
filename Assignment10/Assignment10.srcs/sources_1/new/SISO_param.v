`timescale 1ns / 1ps

// parametrized SISO
module SISO_param #(
parameter WIDTH = 4
)(
 input clk,
 input rst,
 input s_in,
 output s_out
    );
    
    reg [WIDTH-1:0] shift_ff;
    
    always @(posedge clk)
     begin
       if(rst) 
        shift_ff  <= 0;
       else
        begin
         shift_ff <= {s_in,shift_ff[WIDTH-1:1]};
        end
     end
     
     assign s_out = shift_ff[0];
     
endmodule