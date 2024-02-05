`timescale 1ns / 1ps

//testbench for demux 1:4
module tb_demux_1x4();

reg tb_in;
reg [1:0]tb_sel;
wire tb_demux_out0,tb_demux_out1,tb_demux_out2,tb_demux_out3;

//module instance
demux_1x4 DUT(.in(tb_in),.sel(tb_sel),.demux_out0(tb_demux_out0),.demux_out1(tb_demux_out1),.demux_out2(tb_demux_out2),.demux_out3(tb_demux_out3));


//Generating stimulus
integer i;
initial
begin
tb_in <= 1'b0;
tb_sel <= 2'b00;
#10;

for(i=0;i<16;i=i+1)
begin
tb_in <= $urandom_range(0,1);
tb_sel <= $urandom_range(2'b00,2'b11);
#10;
end

$finish();
end
endmodule
