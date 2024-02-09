`timescale 1ns / 1ps

// improvise memory.
// 64 x 32 x 8
// D x B x W;

module improvised_memory(
 input clk,
 input arst,
 input enable,
 input [31:0]address_x,  // horizontal 
 input [63:0]address_y,  // vertical
 input ReadWrite,
 input [7:0]data_in,
 output reg [7:0]data_out
    );
    
    
    // 2D memory 
    reg [7:0]mem[0:63][0:31];
    
    // intgers
    integer i,j;
    
    // read and write logic
    always @(posedge clk)
     begin
      if(arst)
        for(i=0;i<64;i=i+1)
         begin
           for(j=0;j<32;j=j+1)
             begin
               mem[i][j] <= 0;
             end
         end
      else
         begin  
           if(enable && !ReadWrite)  // Writing data.
             begin
                mem[address_x][address_y] <= data_in;
                data_out <= 8'hzz;
             end
            else if(enable && ReadWrite)  // Reading data.
              begin
                data_out <= mem[address_x][address_y];
              end
         end
     end
     
endmodule
