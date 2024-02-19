`timescale 1ns / 1ps

// controller for GCD datapath.

module controllerGCD(
 input clk,
 input start,
 input lt,gt,eq,
 output reg ldA,ldB,sel1,sel2,sel_in,done
    );
    
    // states
    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100,
              S5 = 3'b101;
    
    // state register    
    reg [2:0]state;

    // state transitions.
    always @(posedge clk)
     begin
       case(state)
          S0: begin
               if(start)
                 state <= S1;
          end
          
          S1: begin
              state <= S2;
          end
          
          S2: begin
              if(eq)
                 state <= S5;
              else if(lt)
                 state <= S3;
              else if(gt)
                 state <= S4;
          end
          
          S3: begin
              if(eq)
                  state <= S5;
              else if(lt)
                  state <= S3;
              else if(gt)
                  state <= S4;
          end
          
           
          S4: begin
              if(eq)
                  state <= S5;
              else if(lt)
                  state <= S3;
              else if(gt)
                  state <= S4;
          end
          
          S5: begin
              state <= S5;
          end
          
          default: state <= S0;
       endcase
     end
     
     
     // output logic.
     always @(*)
       begin
         case(state)
           S0: begin
               sel_in = 1'b1;
               ldA = 1'b1;
               ldB = 1'b0;
               done = 1'b0;
           end
           
           S1: begin
               sel_in = 1'b1;
               ldA = 1'b0;
               ldB = 1'b1;
               done = 1'b0;
           end
           
            S2: begin
                if(eq)
                  begin
                    done = 1'b1;
                  end
               else if(lt)
                 begin
                   sel1 = 1'b1;
                   sel2 = 1'b0;
                   sel_in = 1'b0;
                   ldA = 1'b0;
                   ldB = 1'b1;
                 end
              else if(gt)
                 begin
                   sel1 = 1'b0;
                   sel2 = 1'b1;
                   sel_in = 1'b0;
                   ldA = 1'b1;
                   ldB = 1'b0;
                 end
           end
           
           S3: begin
                if(eq)
                  begin
                    done = 1'b1;
                  end
               else if(lt)
                 begin
                   sel1 = 1'b1;
                   sel2 = 1'b0;
                   sel_in = 1'b0;
                   ldA = 1'b0;
                   ldB = 1'b1;
                 end
              else if(gt)
                 begin
                   sel1 = 1'b0;
                   sel2 = 1'b1;
                   sel_in = 1'b0;
                   ldA = 1'b1;
                   ldB = 1'b0;
                 end
           end
           
            S4: begin
                if(eq)
                  begin
                    done = 1'b1;
                  end
               else if(lt)
                 begin
                   sel1 = 1'b1;
                   sel2 = 1'b0;
                   sel_in = 1'b0;
                   ldA = 1'b0;
                   ldB = 1'b1;
                 end
              else if(gt)
                 begin
                   sel1 = 1'b0;
                   sel2 = 1'b1;
                   sel_in = 1'b0;
                   ldA = 1'b1;
                   ldB = 1'b0;
                 end
           end
           
           S5: begin
               done = 1'b1;
               sel1 = 1'b0;
               sel2 = 1'b0;
               ldA = 1'b0;
               ldB = 1'b0;
           end
          
          default: begin
                ldA = 1'b0;
                ldB = 1'b0;
          end
         endcase
       end
       
endmodule
