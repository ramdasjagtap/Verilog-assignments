`timescale 1ns / 1ps

// decoder 3:8 using casez
module decoder_3x8_casez(
input [2:0]in,
input en,
output reg [7:0]dec_out_casez
    );

    always @(in,en)
    begin
        casez({en,in})
            4'b0000: begin
                dec_out_casez <= 8'b00000001;
            end
            4'b0001: begin
                dec_out_casez <= 8'b00000010;
            end
            4'b0010: begin
                dec_out_casez <= 8'b00000100;
            end
            4'b0011: begin
                dec_out_casez <= 8'b00001000;
            end
            4'b0100: begin
                dec_out_casez <= 8'b00010000;
            end
            4'b0101: begin
                dec_out_casez <= 8'b00100000;
            end
            4'b0110: begin
                dec_out_casez <= 8'b01000000;
            end
            4'b0111: begin
                dec_out_casez <= 8'b10000000;
            end
            4'b1???: begin
                dec_out_casez <= 8'b00000000;
            end
        endcase
    end
endmodule