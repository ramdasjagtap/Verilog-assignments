`timescale 1ns / 1ps

// priority encoder 8:3
module priority_encoder_8x3(
input [7:0] in,
output reg [3:0]encoder_out
);

always @(in)
begin
 case(in)
     8'b00000001: begin
         encoder_out <= 3'b000;
     end
     8'b00000010: begin
         encoder_out <= 3'b001;
     end
     8'b00000100: begin
         encoder_out <= 3'b010;
     end
     8'b00001000: begin
         encoder_out <= 3'b011;
     end
     8'b00010000: begin
         encoder_out <= 3'b100;
     end
     8'b00100000: begin
         encoder_out <= 3'b101;
     end
     8'b01000000: begin
         encoder_out <= 3'b110;
     end
     8'b10000000: begin
         encoder_out <= 3'b111;
     end

 endcase
// end    
end
endmodule