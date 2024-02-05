`timescale 1ns / 1ps

//testbench for demux 1:2
module tb_demux_1x2_gate();

reg tb_in;
reg tb_sel;
wire [1:0]tb_demux_out;

// module instance
demux_1x2_gate DUT(.in(tb_in),.sel(tb_sel),.demux_out(tb_demux_out));


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
