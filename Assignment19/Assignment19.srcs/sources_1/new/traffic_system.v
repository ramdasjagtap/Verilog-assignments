`timescale 1ns / 1ps

// short timer = 3 bits
// long timer = 4 bits
module traffic_system(
 input clk,
 input rst,
 input C,
 output reg HG,HY,HR,
 output reg FG,FY,FR,
 output reg ST
    );
    
    // timer reset -> C && TL
        
    wire TL,TS;
    short_timer TS0(.clk(clk),.arst(rst),.TS_start(ST),.TS_out(TS));
    long_timer TL0(.clk(clk),.arst(rst),.TL_start(ST),.TL_out(TL));
    
    
   // assign ST = TS_start || TL_start;
    
    //states declarations
    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;
              
    // state registers
    reg [1:0] state;
    reg [1:0] nxt_state;
    
    // state transitions
    always @(posedge clk)
     begin
      if(rst)
        begin
          state <= S0;
          HG <= 1'b1;
          HY <= 1'b0;
          HR <= 1'b0;
          FR <= 1'b1;
          FG <= 1'b0;
          FY <= 1'b0;
        end
      else
        begin
          state <= nxt_state;
        end
     end
     
     
     always@(*)
      begin
       case(state)
       S0: begin
           if(!(TL && C))
             begin
               nxt_state = S0;
             end
           else if(TL && C)
            begin
              nxt_state = S1;
            end
       end
       
       S1: begin
            if(!TS)
              begin
                nxt_state = S1;
              end
           else if(TS)
             begin
               nxt_state = S2;
             end
       end
       
       S2: begin
            if(!TS)
              begin
                 nxt_state = S2;
              end
            else if(TS)
              begin
                 nxt_state = S3;
              end
       end
       
       S3: begin
           if(!TS)
             begin
               nxt_state = S3;
             end
           else if(TS)
             begin
               nxt_state = S0;
             end
       end
       endcase
      end
      
      //output
     always@(*)
      begin
       case(state)
       S0: begin
           if(!(TL && C))
             begin
              // HG = 1;
               //FR = 1;
               HG <= 1'b1;
               HY <= 1'b0;
               HR <= 1'b0;
               FR <= 1'b1;
               FG <= 1'b0;
               FY <= 1'b0;
               ST = 0;
             end
           else if(TL && C)
            begin
             // HY = 1;
             // FR = 1;
               HG <= 1'b0;
               HY <= 1'b1;
               HR <= 1'b0;
               FR <= 1'b1;
               FG <= 1'b0;
               FY <= 1'b0;
              ST = 1;
            end
       end
       
       S1: begin
            if(!TS)
              begin
               HG <= 1'b0;
               HY <= 1'b1;
               HR <= 1'b0;
               FR <= 1'b1;
               FG <= 1'b0;
               FY <= 1'b0;
                ST = 0;
               // nxt_state = S1;
              end
           else if(TS)
             begin
                HG <= 1'b0;
               HY <= 1'b0;
               HR <= 1'b1;
               FR <= 1'b0;
               FG <= 1'b1;
               FY <= 1'b0;
               ST = 0;
               //nxt_state = S2;
             end
       end
       
       S2: begin
             if(!TS)
              begin
                HG <= 1'b0;
               HY <= 1'b0;
               HR <= 1'b1;
               FR <= 1'b0;
               FG <= 1'b1;
               FY <= 1'b0;
                ST = 0;
                 //nxt_state = S2;
              end
            else if(TS)
              begin
               HG <= 1'b0;
               HY <= 1'b0;
               HR <= 1'b1;
               FR <= 1'b0;
               FG <= 1'b0;
               FY <= 1'b1;
                ST = 0;
                 //nxt_state = S3;
              end
       end
       
       S3: begin
           if(!TS)
             begin
               HG <= 1'b0;
               HY <= 1'b0;
               HR <= 1'b1;
               FR <= 1'b0;
               FG <= 1'b0;
               FY <= 1'b1;
                ST = 0;
               //nxt_state = S3;
             end
           else if(TS)
             begin
              HG <= 1'b1;
               HY <= 1'b0;
               HR <= 1'b0;
               FR <= 1'b1;
               FG <= 1'b0;
               FY <= 1'b0;
               ST = 1;
              // nxt_state = S0;
             end
       end
       endcase
      end
      
endmodule
