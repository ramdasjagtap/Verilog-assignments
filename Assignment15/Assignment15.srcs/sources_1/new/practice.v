`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 03:28:59 PM
// Design Name: 
// Module Name: practice
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


module practice(
    input clock,
    input a,
    output reg p,
    output reg q );

    always @(clock,a)
        begin
            p <= a;
        end
    
    always @(negedge clock)
        begin
             q <= a;
        end
endmodule
