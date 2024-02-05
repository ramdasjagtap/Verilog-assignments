`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 11:20:55 AM
// Design Name: 
// Module Name: tb_counter2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_counter2();

reg clk;
reg arst;
wire alarm;

counter2 DUT(.clk(clk),.arst(arst),.alarm(alarm));

always
  begin
   clk = 1'b1;
   #5;
   clk = 1'b0;
   #5;
  end
  
  initial
   begin
    arst <= 1'b1;
    #10;
    arst <= 1'b0;
    #100;
    $finish();
   end
endmodule
