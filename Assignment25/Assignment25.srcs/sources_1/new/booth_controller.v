`timescale 1ns / 1ps

// booth controller
module booth_controller(
 input clk,
 input start,
 input qm1,q0,eqz,
 output  ldA,clrA,sftA,
 output  ldQ,clrQ,sftQ,
 output  ldM,clrff,
 output  decr,ldcnt,
 output  addsub,done
    );
    
    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100,
              S5 = 3'b101,
              S6 = 3'b110;
              
    reg [2:0] state;
    
    // state transition.
    always @(posedge clk)
      begin
        case(state)
          S0: begin
             if(start)
               state <= S1;
            else
               state <= S0;
          end
          
         S1: begin
              state <= S2;
         end
         
         S2: begin
              if({q0,qm1} == 2'b01)
                begin
                  state <= S3;
                end
             else if({q0,qm1} == 2'b10)
                begin
                  state <= S4;
                end
             else
                begin
                  state <= S5;
                end
         end
         
         S3: begin
             state <= S5;
         end
         
         S4: begin
             state <= S5;
         end
         
         S5: begin
             if({q0,qm1} == 2'b01 && !eqz)  // (count != 0)
               begin
                  state <= S3;
               end
             else if({q0,qm1} == 2'b10 && !eqz)  // (count != 0)
               begin
                  state <= S4;
               end
             else 
               begin
                 state <= S6;
               end
         end
         
         S6: begin
            state <= S6;
         end
         
         default: state <= S0;
         
        endcase
      end
      
      
      // output logic.
    assign ldA = ((state == S3)||(state == S4))?1'b1:1'b0;
    assign clrA = (state == S0)?1'b1:1'b0;
	assign sftA = (state == S5)?1'b1:1'b0;
    assign ldQ = (state == S2)?1'b1:1'b0;
    assign clrQ = (state == S0)?1'b1:1'b0;
	assign sftQ = (state == S5)?1'b1:1'b0;
    assign ldM = (state == S1)?1'b1:1'b0;
    assign clrff = (state == S0)?1'b1:1'b0;
	assign addsub = (state == S3)?1'b1:1'b0;
	assign decr = (state == S5)?1'b1:1'b0;
	assign ldcnt = (state == S1)?1'b1:1'b0;
	assign done = (state == S6)?1'b1:1'b0;
	
endmodule
