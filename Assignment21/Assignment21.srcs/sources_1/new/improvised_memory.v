`timescale 1ns / 1ps

// improvise memory.
// 64 x 32 x 8
// D x B x W;

module improvised_memory(
 input clk,
 input enable,
 input [3:0]address_x,  // horizontal 
 input [6:0]address_y,  // vertical
 input ReadWrite,
 input [7:0]data_in,
 output  [7:0]data_out
    );
    
    
    // 2D memory 
    reg [7:0]mem[0:63][0:31];
    reg [7:0]temp;
    // intgers
    integer i,j;
    
    // read and write logic
    always @(posedge clk)
         begin  
           if(enable && !ReadWrite)  // Writing data.
             begin
                mem[address_x][address_y] <= data_in;
             end
     end
     
     always @(posedge clk)
       begin 
         if(enable && ReadWrite)  // Reading data.
              begin
                temp <= mem[address_x][address_y];
              end
       end
      
      assign data_out = (enable && ReadWrite)?temp:'hzz; 
       
endmodule
