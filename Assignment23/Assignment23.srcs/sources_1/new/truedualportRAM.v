`timescale 1ns / 1ps


// true dual port RAM
// data can be read and write from both ports
// both ports operates on different clocks.
module truedualportRAM #(parameter WIDTH= 8,
parameter DEPTH = 32,
parameter ADDR_W = 6)(
 input clk,
 input en_0,en_1,
 input out_en_0,out_en_1,
 input ReadWrite_0,ReadWrite_1,
 input [ADDR_W-1:0]address_0,address_1,
 inout [WIDTH-1:0]data_0,
 inout  [WIDTH-1:0]data_1
 );
 
  // RAM
  reg [WIDTH-1:0]RAM[0:DEPTH-1];
  integer i;
  reg [WIDTH-1:0]temp0;
  reg [WIDTH-1:0]temp1;
  
  // Port -> 0
  // memory write (
  always @(posedge clk)
    begin
         if(en_0 && !ReadWrite_0)
            RAM[address_0] <= data_0;
    end
    
    // memory Read
   always @(posedge clk)
    begin
         if(en_0 && ReadWrite_0)
           temp0 <= RAM[address_0];
    end
    
 assign data_0 = (en_0 && ReadWrite_0 && out_en_0)?temp0:'hzz;
 
  // Port -> 1
  // memory write 
  always @(posedge clk)
    begin
         if(en_1 && !ReadWrite_1)
            RAM[address_1] <= data_1;
    end
    
    // memory Read.
   always @(posedge clk)
    begin
         if(en_1 && ReadWrite_1)
           temp1 <= RAM[address_1];
    end
    
 assign data_1 = (en_1 && ReadWrite_1 && out_en_1)?temp1:'hzz;

endmodule
