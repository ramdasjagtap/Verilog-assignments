`timescale 1ns / 1ps

// testing
module tb_memory8x4();

reg tb_clk;
reg tb_arst;
reg tb_enable;
reg [3:0]tb_address;
reg tb_ReadWrite;
reg [3:0]tb_data_in;
wire [3:0]tb_data_out;

//memory8x4 #(4,8)DUT(.clk(tb_clk),.arst(tb_arst),.enable(tb_enable),.address(tb_address),.ReadWrite(tb_ReadWrite),.data_in(tb_data_in),.data_out(tb_data_out));
parameterized_memory #(4,8)DUT(.clk(tb_clk),.arst(tb_arst),.enable(tb_enable),.address(tb_address),.ReadWrite(tb_ReadWrite),.data_in(tb_data_in),.data_out(tb_data_out));

always #5 tb_clk = ~tb_clk;

initial
 begin
  tb_arst <= 1'b1;
  tb_clk <= 1'b0;
  tb_enable <= 1'b0;
  tb_address <= 0;
  tb_ReadWrite <= 1'b0;
  tb_data_in <= 4'h0;
  #10;   // writting data in memory.
  tb_arst <= 1'b0;
  tb_address <= 'h0;
  tb_enable <= 1'b1;
  tb_data_in <= 4'h1;
  #10;
  tb_address <= 'h1;
  tb_enable <= 1'b1;
  tb_data_in <= 4'h2;
  #10;
  tb_address <= 'h2;
  tb_enable <= 1'b1;
  tb_data_in <= 4'h3;
  #10;
  tb_address <= 'h3;
  tb_enable <= 1'b1;
  tb_data_in <= 4'h4;
  #10;
  tb_address <= 'h4;
  tb_enable <= 1'b1;
  tb_data_in <= 4'h5;
  #10;
  tb_address <= 'h5;
  tb_enable <= 1'b1;
  tb_data_in <= 4'h6;
  #10;
  tb_address <= 'h6;
  tb_enable <= 1'b1;
  tb_data_in <= 4'h7;
  #10;
  tb_address <= 'h7;
  tb_enable <= 1'b1;
  tb_data_in <= 4'h8;
  
  
  // reading data
  #150;
  tb_ReadWrite = 1'b1;
  tb_address <= 'h7;
  #10
  tb_address <= 'h6;
  #10
  tb_address <= 'h5;
  #10
  tb_address <= 'h4;
  #10
  tb_address <= 'h3;
  #10
  tb_address <= 'h2;
  #10
  tb_address <= 'h1;
  #10
  tb_address <= 'h0;
  #300;
  $finish();
 end
endmodule
