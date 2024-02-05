`timescale 1ns / 1ps

// Decoder 2:4 using case
module decoder_2x4_case(
    input [1:0]in,
    output reg [3:0]dec_out_case
    );

    always @(in)
    begin
        case(in)
            2'b00: begin
                   dec_out_case <= 4'b0001;
                   end
                   2'b01: begin
                       dec_out_case <= 4'b0010;
                   end
                   2'b10: begin
                       dec_out_case <= 4'b0100;
                   end
                   2'b11:begin
                       dec_out_case <= 4'b1000;
                   end
        endcase
    end
endmodule