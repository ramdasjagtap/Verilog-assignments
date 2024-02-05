`timescale 1ns / 1ps

// Testbench for 4:1
module tb_mux_4x1();
reg tb_in_0;
reg tb_in_1;
reg tb_in_2;
reg tb_in_3;
reg [1:0]tb_sel;
wire tb_mux_out;

 // module instance
mux_4x1 DUT(.in_0(tb_in_0),.in_1(tb_in_1),.in_2(tb_in_2),.in_3(tb_in_3),.sel(tb_sel),.mux_out(tb_mux_out));
 
integer i;

//Generating stimulus
initial
begin
 tb_in_0 <= 1'b0;
 tb_in_1 <= 1'b0;
 tb_in_2 <= 1'b0;
 tb_in_3 <= 1'b0;
 tb_sel <= 2'b00;
 #10;

 for (i =0;i<16;i=i+1)
 begin
 tb_in_0 <= $random%2;
 tb_in_1 <= $random%2;
 tb_in_2 <= $random%2;
 tb_in_3 <= $random%2;
 tb_sel <= $urandom_range(0,2'h3);
 #10;
 end
 
 $finish();
end

endmodule