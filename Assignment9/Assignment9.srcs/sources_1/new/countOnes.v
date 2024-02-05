`timescale 1ns / 1ps

// Function to count the number of ones in byte.
module countOnes(input [7:0]byte,output reg [3:0]count);


// Function to count the 1s in BYTE.
  function [3:0] countOnesfunc(input [7:0] data);
    integer i;
    begin
     countOnesfunc = 0;
     for (i = 0; i < 8; i = i + 1) 
      begin
       if (data[i] == 1'b1) 
        begin
         countOnesfunc = countOnesfunc + 1;
        end
       end
     end
  endfunction

  always @(*)
   begin
    count = countOnesfunc(byte);
  end

endmodule
