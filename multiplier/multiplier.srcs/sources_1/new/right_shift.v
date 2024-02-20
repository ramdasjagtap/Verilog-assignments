`timescale 1ns / 1ps

// right shift
module right_shift(
 input clk,
 input rst,
 input [15:0] data_in,
 output reg [15:0]data_out
    );
    
    always @(posedge clk)
     begin
       if(rst)
        begin
          data_out <= 0;
        end
      else 
       begin
         data_out <= {data_in[15],data_in[15:1]};
       end
     end
endmodule

