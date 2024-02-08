`timescale 1ns / 1ps

// over lapping allowed
module mealy_seq_detect_overlap(
 input clk,
 input rst,
 input in,
 output reg out
    );
    
    // state declaration
    parameter A = 2'b00,
              B = 2'b01,
              C = 2'b10;
              
       // states registers
     reg [1:0] state;
     reg [1:0] nxt_state;
     
    // state transitions
    always @(posedge clk or posedge rst)
     begin
       if(rst)
        begin
         out = 0;
         state <= A;
        end
       else
         state <= nxt_state;
     end
     
     // nxt state logic
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
             nxt_state = B;
           end
          else
           begin
             nxt_state = C;
           end
       end
       
       C: begin
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
      
      
      // output
      always @(*)
      begin
       case(state)
       A: begin 
          if(in)
            begin
             out = 0;
            end
          else
            begin
             out = 0;
            end
       end
       
       B: begin
          if(in)
           begin
             out = 0;
           end
          else
           begin
             out = 0;
           end
       end
       
       C: begin
          if(in)
            begin
              out = 1;
            end
          else
            begin
             out = 0;
            end
       end
       endcase
      end
endmodule
