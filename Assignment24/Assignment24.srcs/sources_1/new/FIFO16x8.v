`timescale 1ns / 1ps

// FIFO 
// Depth = 16 and word size = 8 bits

// Never Write to full fifo
// Never read form empty fifo.
module FIFO16x8(
 input clk,
 input rst,
 input wr_en,
 input rd_en,
 input [7:0]din,
 output reg [7:0]dout,
 output full,
 output empty
    );
    
    // read pointer
    reg [3:0]rptr;
    // write pointer
    reg [3:0] wptr;
    
    
    // fifo
    reg [7:0] FIFO[0:15];
    
    
    // Writing data in fifo
    always @(posedge clk)
      begin
       if(rst)
         begin
          wptr <= 0;
         end
       else
         begin
           if(wr_en && !full)
             begin
               FIFO[wptr] <= din;
               wptr <= wptr + 4'h1;
             end
         end
      end
      
      
      //Reading data from fifo.
      always @(posedge clk)
        begin
         if(rst)
           begin
             rptr <= 0;
           end
        else
          begin
            if(rd_en && !empty)
              begin
               dout <= FIFO[rptr];
               rptr <= rptr + 4'h1;
              end
          end
        end
        
        assign full = ((wptr + 1) == rptr);
        assign empty = (wptr == rptr);
endmodule
