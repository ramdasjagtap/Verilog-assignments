`timescale 1ns / 1ps

// mux 4:1 using case keyword
module mux_4x1_case(
input in_0,
input in_1,
input in_2,
input in_3,
input [1:0]sel,
output reg mux_out
    );

    always @({in_0,in_1,in_2,in_3,sel})
    begin
        case(sel)
            2'b00: mux_out <= in_0;
            2'b01: mux_out <= in_1;
            2'b10: mux_out <= in_2;
            2'b11: mux_out <= in_3;
        default:mux_out <= 2'bxx;
        endcase
    end
endmodule