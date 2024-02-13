`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////

module parameterizedRAM #(parameter WIDTH= 8,
parameter DEPTH = 32,
parameter ADDR_W = 6)(
 input clk,
 input en_0,en_1,
 input Write_0,Read_1,
 input [ADDR_W-1:0]address_0,address_1,
 input [WIDTH-1:0]data_in,
 output  [WIDTH-1:0]data_out
    );
    
    // RAM
    reg [WIDTH-1:0]temp;
    reg [WIDTH-1:0]RAM[0:DEPTH-1];
    integer i;
    
    
    // Writing data.
    always @(posedge clk)
        begin
          if(en_0 && !Write_0)
            begin
               RAM[address_0] <= data_in;
            end
     end
     
     
     
     // Reading data
     always @(posedge clk)
       begin
              if(en_1 && Read_1)
              begin
                temp <= RAM[address_1];
              end
       end
       
     assign data_out = (en_1 && Read_1)?temp:'hzz;
     
endmodule
