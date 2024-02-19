`timescale 1ns / 1ps

//controller for multiplication by repeated addition.
module controller1(
  input clk,
  input arst_n,
  input eqz,
  output reg ldA,ldP,ldB,clrP,decB,done
    );
    
    // states;
    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100;
              
     // state registers.      
    reg [2:0]state;
    reg [2:0]nxt_state;
   
    // state transitions
    always @(posedge clk or negedge arst_n)
     begin
        if(!arst_n)
          begin
            state <= S0;
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
        S0:  begin
           nxt_state = S1;
        end
        
        S1: begin
            nxt_state = S2;
        end
        
        S2: begin
           nxt_state = S3;
        end
        
        S3: begin
           if(eqz == 1'b1)
             begin
               nxt_state = S4;
             end
           else
             begin
               nxt_state = S3;
             end
        end
        
        S4: begin
            nxt_state = S0;
          end
          
          default: nxt_state = S0;
        endcase
       end
       
       // output logic
       always @(*)
         begin
           case(state)
            S0:  begin
               ldA = 1'b0;
               ldB = 1'b0;
               clrP = 1'b0;
               ldP = 1'b0;
               decB = 1'b0;
               done = 1'b0;
             end
        
            S1: begin
               ldA = 1'b1;
               ldB = 1'b0;
               clrP = 1'b0;
               ldP = 1'b0;
               decB = 1'b0;
               done = 1'b0;
             end
        
            S2: begin
               ldA = 1'b0;
               ldB = 1'b1;
               clrP = 1'b1;
               ldP = 1'b0;
               decB = 1'b0;
               done = 1'b0;
             end
             
             S3: begin
                if(!eqz)
                  begin
                    ldA = 1'b0;
                    ldB = 1'b0;
                    clrP = 1'b0;
                    ldP = 1'b1;
                    decB = 1'b1;
                   done = 1'b0;
                  end
                else
                 begin
                   ldA = 1'b0;
                   ldB = 1'b0;
                   clrP = 1'b0;
                   ldP = 1'b0;
                   decB = 1'b0;
                   done = 1'b1;
                 end
             end
             
             
            S4: begin
               ldA = 1'b0;
               ldB = 1'b0;
               clrP = 1'b0;
               ldP = 1'b0;
               decB = 1'b0;
               done = 1'b1;
             end
             
           default:begin
                ldA = 1'b0;
                ldB = 1'b0;
                clrP = 1'b0;
                ldP = 1'b0;
                decB = 1'b0;
                done = 1'b0;
               end
           endcase
         end
        
endmodule
