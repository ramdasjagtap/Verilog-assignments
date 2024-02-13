`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////

module parameterizedRAM #(parameter WIDTH= 8,
parameter DEPTH = 32,
parameter ADDR_W = 6)(
 input clk_0,clk_1,
 input clr_0,clr_1,
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
    always @(posedge clk_0)
     begin
      if(clr_0)
        begin
          for(i=0;i<DEPTH;i=i+1)
            begin
               RAM[i] <= 0;
            end
        end
      else
        begin
          if(en_0 && !Write_0)
            begin
               RAM[address_0] <= data_in;
            end
          else if(en_0 && Write_0)
            begin
               RAM[address_0] <= 'hzz;
            end
        end
     end
     
     
     // Reading data
     always @(posedge clk_1)
       begin
         if(clr_1)
           begin
             for(i=0;i<DEPTH;i=i+1)
               begin
                RAM[i] <= 0;
               end
           end
         else
           begin
              if(en_1 && Read_1)
              begin
                temp <= RAM[address_1];
              end
              else if(en_1 && Read_1)
              begin
                 temp <= 'hzz;
              end
           end
       end
       
     assign data_out = (en_1 && Read_1)?temp:'hzz;
     
endmodule
