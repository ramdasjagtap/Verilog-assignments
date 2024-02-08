`timescale 1ns / 1ps

// mealy machine to detect the sequence of 10101.
// overlapping
module mealy_fsm(
 input clk,
 input arst,
 input seq_i,
 output reg det_o
    );
    
    // states declaration
    parameter A = 3'b000,
              B = 3'b001,
              C = 3'b010,
              D = 3'b011,
              E = 3'b100;
              
   // state registers.
   reg [2:0] state;
   reg [2:0] nxt_state;
   
   // state transition
   always @(posedge clk or posedge arst)
     begin
       if(arst)
         begin
           state <= A;
           det_o <= 0;
         end  
       else
         begin
           state <= nxt_state;
         end
     end
     
     always @(*)
      begin
        case(state)
        A: begin
           if(seq_i)
             begin
               nxt_state = B;
             end
           else
             begin
               nxt_state = A;
             end
        end
        
        B: begin
           if(seq_i)
            begin
              nxt_state = B;
            end
           else
             begin
               nxt_state = C;
             end
        end
        
        C: begin
           if(seq_i)
            begin
              nxt_state = D;
            end
           else
             begin
               nxt_state = A;
             end
        end
        
        D: begin
           if(seq_i)
            begin
              nxt_state = B;
            end
           else
             begin
               nxt_state = E;
             end
        end
        
        E: begin
           if(seq_i)
            begin
              nxt_state = D;
            end
           else
             begin
               nxt_state = A;
             end
        end
        endcase
      end
endmodule
