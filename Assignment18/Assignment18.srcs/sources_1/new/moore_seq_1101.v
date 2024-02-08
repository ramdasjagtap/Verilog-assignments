`timescale 1ns / 1ps

// 1101 
// moor machine
// non-overlapping
module moore_seq_1101(
 input clk,
 input arst,
 input in,
 output reg out
    );
    
    
    parameter A = 3'b000,
              B = 3'b001,
              C = 3'b010,
              D = 3'b011,
              E = 3'b100;
              
    reg [2:0] state;
    reg [2:0] nxt_state;
    
    always @(posedge clk)
     begin
       if(arst)
        begin
          state <= A;
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
            if(in)
              begin
                nxt_state = B;
              end
            else
             begin
               nxt_state = A;
             end
        end
        
        B: begin
            if(in)
              begin
               nxt_state = C;
              end
            else
              begin
               nxt_state = A;
              end
        end
        
        C: begin
            if(in)
              begin
               nxt_state = C;
              end
            else
              begin
               nxt_state = D;
              end
        end
        
        D: begin
            if(in)
              begin
               nxt_state = E;
              end
            else
              begin
               nxt_state = A;
              end
        end
        
        E: begin
            if(in)
              begin
               nxt_state = B;
              end
            else
              begin
               nxt_state = A;
              end
        end
       endcase
       end
       
       always @(state)
       begin
        case(state)
         A: out = 0;
         B: out = 0;
         C: out = 0;
         D: out = 0;
         E: out = 1;
        endcase
       end
endmodule
