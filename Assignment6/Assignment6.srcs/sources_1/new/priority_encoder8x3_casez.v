`timescale 1ns / 1ps

// priority encoder using casez 
module priority_encoder8x3_casez(
input [7:0] in,
output reg [3:0]encoder_out
);

always @(in)
begin
 casez(in)
     8'b00000001: begin
         encoder_out <= 3'b000;
     end
     8'b0000001?: begin
         encoder_out <= 3'b001;
     end
     8'b000001??: begin
         encoder_out <= 3'b010;
     end
     8'b00001???: begin
         encoder_out <= 3'b011;
     end
     8'b0001????: begin
         encoder_out <= 3'b100;
     end
     8'b001?????: begin
         encoder_out <= 3'b101;
     end
     8'b01??????: begin
         encoder_out <= 3'b110;
     end
     8'b1???????: begin
         encoder_out <= 3'b111;
     end

 endcase  
end
endmodule