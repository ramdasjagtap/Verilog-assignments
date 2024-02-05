`timescale 1ns / 1ps

// mux 4:1 using if else condition
module mux_4x1_ifelse(
input in_0,in_1,in_2,in_3,
input [1:0]sel,
output reg mux_out
    );
    
    always @(in_0,in_1,in_2,in_3,sel)
    begin
    if(sel == 2'b00)
     begin
       mux_out <= in_0;
     end
    else if(sel == 2'b01)
     begin
       mux_out <= in_1;
     end
    else if(sel == 2'b10)
     begin
       mux_out <= in_2;
     end
    else if(sel == 2'b11)
     begin
       mux_out <= in_3;
     end
    end
endmodule
