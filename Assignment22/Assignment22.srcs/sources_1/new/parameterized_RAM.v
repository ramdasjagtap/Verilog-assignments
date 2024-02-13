`timescale 1ns / 1ps

// parameterized RAM.
module parameterized_RAM
#(parameter ADDR_WIDTH = 5,
  parameter RAM_WIDTH = 8,
  parameter RAM_DEPTH = 16)(
 input clk,
 input cs,
 input enable,
 input out_en,
 input ReadWrite,
 input [ADDR_WIDTH-1:0]address,
 inout [RAM_WIDTH-1:0] data
    );
    
    // memory
    reg [RAM_WIDTH-1:0]RAM[0:RAM_DEPTH-1];
    integer i;
    
    reg [RAM_WIDTH-1:0]temp;
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

     // output
     assign data = (cs && out_en && ReadWrite)?temp:'hzz;
     
endmodule
