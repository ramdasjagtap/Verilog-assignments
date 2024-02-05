`timescale 1ns / 1ps

// decoder  2:4 using casez
module decoder_2x4_casez(
    input [1:0]in,
    input en,
    output reg [3:0]dec_out_casez
    );

    always @(in,en)
    begin
        casex({en,in})
            3'b000: begin
                   dec_out_casez <= 4'b0001;
                   end
                   3'b001: begin
                       dec_out_casez <= 4'b0010;
                   end
                   3'b010: begin
                       dec_out_casez <= 4'b0100;
                   end
                   3'b011:begin
                       dec_out_casez <= 4'b1000;
                   end
                   3'b1??: begin
                       dec_out_casez <= 4'b0000;
                   end
        endcase
    end
endmodule