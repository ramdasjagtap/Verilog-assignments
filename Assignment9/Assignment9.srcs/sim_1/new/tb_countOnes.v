`timescale 1ns / 1ps



// test bench for countOnes
module tb_countOnes();

reg [7:0]tb_byte;
wire [3:0]tb_count;


// module instace
countOnes DUT(.byte(tb_byte),.count(tb_count));

task generateRandomInput;
    integer i;
    
    //reg [7:0]data = 8'b00000001;
    begin
       for (i = 0; i < 32; i = i + 1)
        begin
          #20 tb_byte <= $random;
        end
     end
  endtask


// monitor task.
initial
 begin
  $monitor("tb_byte - %h ",tb_byte);
  #20 generateRandomInput;
  $finish();
 end
 
endmodule
