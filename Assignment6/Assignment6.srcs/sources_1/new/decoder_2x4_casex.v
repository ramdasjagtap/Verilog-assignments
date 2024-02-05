`timescale 1ns / 1ps

// decoder 2:4 using casex
// casex-> x,z,? as don't care
module decoder_2x4_casex(
    input [1:0]in,
    input en,
    output reg [3:0]dec_out_casex
    );

    always @(in,en)
    begin
        casex({en,in})
            3'b000: begin
                   dec_out_casex <= 4'b0001;
                   end
            3'b001: begin
                       dec_out_casex <= 4'b0010;
                   end
            3'b010: begin
                       dec_out_casex <= 4'b0100;
                   end
            3'b011:begin
                       dec_out_casex <= 4'b1000;
                   end
           3'b1??: begin
                       dec_out_casex <= 4'b0000;
                   end
        endcase
    end
endmodule