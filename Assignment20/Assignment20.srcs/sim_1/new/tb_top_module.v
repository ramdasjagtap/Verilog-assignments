`timescale 1ns / 1ps

// test bench
module tb_top_module();

reg tb_clk;
reg tb_rst_n;
reg tb_d_in;
reg [3:0]tb_A;
reg [3:0]tb_B;
wire [7:0]tb_data_path_out;

integer i;

top_module DUT(.clk(tb_clk),.rst_n(tb_rst_n),.d_in(tb_d_in),.A(tb_A),.B(tb_B),.data_path_out(tb_data_path_out));

always #5 tb_clk = ~tb_clk;

initial
 begin
  tb_rst_n <= 1'b1;
  tb_clk <= 1'b0;
  tb_A <= 0;
  tb_B <= 0;
  tb_d_in <= 0;
  #10;
  tb_rst_n <= 1'b0;
  #5
    
    tb_A <= 4'h3; 
    tb_B <= 4'h6;
    for(i=0;i<512;i=i+1)
      begin
        tb_d_in <= $urandom_range(0,1);
        tb_A <= $urandom_range(0,4'hF);
        tb_B <= $urandom_range(0,4'hF);
        @(negedge tb_clk);
    end
     
    #10;
    $finish();
 end
endmodule
