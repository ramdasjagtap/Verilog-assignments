`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 10:33:22 PM
// Design Name: 
// Module Name: tb_counter
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


module tb_counter();
reg tb_clk;
reg tb_arst;
wire tb_q;

counter DUT(.clk(tb_clk),.arst(tb_arst),.q(tb_q));

always #5 tb_clk = ~tb_clk;

initial
 begin
   tb_clk = 1'b0;
   tb_arst = 1'b1;
   #10;
   tb_arst = 1'b0;
   #1000;
   $finish();
 end
endmodule
