`timescale 1ns / 1ps

//testbench for demux 1:2
module tb_demux_1x2_gate();

reg tb_in;
reg tb_sel;
wire tb_demux_out0;
wire tb_demux_out1;

// module instance
demux_1x2_gate DUT(.in(tb_in),.sel(tb_sel),.demux_out0(tb_demux_out0),.demux_out1(tb_demux_out1));


// Generating modulus
initial
begin
tb_in <= 1'b0;
tb_sel <= 1'b0;
#10;

tb_in <= 1'b1;
tb_sel <= 1'b0;
#10;

tb_in <= 1'b0;
tb_sel <= 1'b1;
#10;

tb_in <= 1'b1;
tb_sel <= 1'b1;
#10;


$finish();
end
endmodule