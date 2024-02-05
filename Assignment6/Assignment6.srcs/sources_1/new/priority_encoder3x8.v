`timescale 1ns / 1ps


//priority encoder 8:3
module priority_encoder8x3(
input [7:0] in,
output reg [3:0]encoder_out
);

always @(in)
begin
 case(in)
     8'b00000001: begin
         encoder_out <= 3'b000;
     end
     8'b0000001x: begin
         encoder_out <= 3'b001;
     end
     8'b000001xx: begin
         encoder_out <= 3'b010;
     end
     8'b00001xxx: begin
         encoder_out <= 3'b011;
     end
     8'b0001xxxx: begin
         encoder_out <= 3'b100;
     end
     8'b001xxxxx: begin
         encoder_out <= 3'b101;
     end
     8'b01xxxxxx: begin
         encoder_out <= 3'b110;
     end
     8'b1xxxxxxx: begin
         encoder_out <= 3'b111;
     end

 endcase
// end    
end
endmodule