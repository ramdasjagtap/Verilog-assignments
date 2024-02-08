`timescale 1ns / 1ps
// moore machine

module moore_seq_detect(
 input clk,
 input rst,
 input seq_i,
 output detect_o
    );
    
    parameter A = 3'b000,
              B = 3'b001,
              C = 3'b010,
              D = 3'b011,
              E = 3'b100,
              F = 3'b101;
              
    reg [2:0]state;
    reg [2:0]nxt_state;
    
    always @(posedge clk)
      begin
       if(rst)
         state <= A;
       else
         state <= nxt_state;
      end
      
      always @(*)
       begin
        case(state)
         A: nxt_state = (seq_i)? B:A;
         B: nxt_state = (seq_i)? B:C;
         C: nxt_state = (seq_i)? D:A;
         D: nxt_state = (seq_i)? E:C;
         E: nxt_state = (seq_i)? B:F;
         F: nxt_state = (seq_i)? B:A;
        endcase
       end
       
       assign detect_o = (state == F);
endmodule
