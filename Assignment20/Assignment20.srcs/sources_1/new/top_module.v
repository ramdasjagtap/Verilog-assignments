`timescale 1ns / 1ps

// top module
// datapath and fsm integration.
module top_module(
 input clk,
 input rst_n,
 input d_in,
 input [3:0]A,
 input [3:0]B,
 output [7:0]data_path_out
    );
    
    // wires declaration.
    wire clr;
    wire q_out;
    wire done;
    
    // sequence detector instance (10101)
    mealy_fsm MF(.clk(clk),.rst_n(rst_n),.d_in(d_in),.q_out(q_out),.clr(clr),.status(done));
    
    // datapath instance
    datapath DP(.clk(clk),.en(q_out),.clr(clr),.A(A),.B(B),.done(done),.data_path_out(data_path_out));
    
endmodule
