`timescale 1ns / 1ps

// simple dual port RAM
// size 32x8 bit

// port 0 will write the data in RAM while port 1 will read data.
module simpledualportRAM(
 input clk,
 input en_0,en_1,
 input Write_0,Read_1,
 input [5:0]address_0,address_1,
 input [7:0]data_in,
 output  [7:0]data_out
 
    );
    
    // RAM
    reg [7:0]temp;
    reg [7:0]RAM[0:31];
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
