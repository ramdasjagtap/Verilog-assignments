`timescale 1ns / 1ps

// mealy machine to detect the sequence of 10101.
// overlapping
module mealy_fsm(
 input clk,
 input rst_n,
 input d_in,
 input status,
 output reg q_out,
 output  clr
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
   always @(posedge clk)
     begin
       if(rst_n)
         begin
           state <= A;
           q_out <= 0;
         end  
       else
         begin
           state <= nxt_state;
         end
     end
     
     // next state logic
     always @(*)
      begin
        case(state)
        A: begin
           if(d_in)
             begin
               nxt_state = B;
             end
           else
             begin
               nxt_state = A;
             end
        end
        
        B: begin
           if(d_in)
            begin
              nxt_state = B;
            end
           else
             begin
               nxt_state = C;
             end
        end
        
        C: begin
           if(d_in)
            begin
              nxt_state = D;
            end
           else
             begin
               nxt_state = A;
             end
        end
        
        D: begin
           if(d_in)
            begin
              nxt_state = B;
            end
           else
             begin
               nxt_state = E;
             end
        end
        
        E: begin
           if(d_in)
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
      
      
      // output 
      always @(*)
      begin
        case(state)
        A: begin
           if(d_in)
             begin
               q_out = 0;
             end
           else
             begin
               q_out = 0;
             end
        end
        
        B: begin
           if(d_in)
            begin
               q_out = 0;
            end
           else
             begin
                q_out = 0;
             end
        end
        
        C: begin
           if(d_in)
            begin
               q_out = 0;
            end
           else
             begin
                q_out = 0;
             end
        end
        
        D: begin
           if(d_in)
            begin
               q_out = 0;
            end
           else
             begin
                q_out = 0;
             end
        end
        
        E: begin
           if(d_in)
            begin
               q_out = 1;
            end
           else
             begin
               q_out = 0;
             end
        end
        endcase
      end

      // clr signal logic 
      assign clr = (status == 1);

endmodule