`timescale 1ns / 1ps

// Single Port RAM (16x8)
module RAM16x8(
 input clk,
 input cs,
 input enable,
 input out_en,
 input ReadWrite,
 input [3:0]address,
 inout [7:0] data
    );
    
    // memory
    reg [7:0]RAM[0:15];
    integer i;
    
    reg [7:0]temp;
    //memory logic.
    always @(posedge clk)
         begin
           if(cs)
             begin  // Data writing
               if(enable && !ReadWrite)
                 begin
                   RAM[address] <= data;
                 end
         end
     end
       
     always @(posedge clk)
         begin
             if(enable && ReadWrite)  // Data Reading
                 begin
                   temp <= RAM[address];
                 end
         end
     // Data Reading
     assign data = (cs && out_en && ReadWrite)?temp:'hzz;
     
endmodule
