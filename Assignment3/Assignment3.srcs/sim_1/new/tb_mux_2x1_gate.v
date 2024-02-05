`timescale 1ns / 1ps

//testbench for mux 2:1 using gate
module tb_mux_2x1_gate();

reg tb_in_0;
reg tb_in_1;
reg tb_sel;
wire tb_mux_out;

//module instance
mux_2x1_gate DUT(.in_0(tb_in_0),.in_1(tb_in_1),.sel(tb_sel),.mux_out(tb_mux_out));


// Generating stimulus
initial
begin
tb_in_0 <= 1'b0;
tb_in_1 <= 1'b0;
tb_sel <= 1'b0;
#10;

tb_in_0 <= 1'b1;
tb_in_1 <= 1'b0;
tb_sel <= 1'b1;
#10;
tb_sel <= 1'b0;
#10;

$finish();
end


// Monitor function (system task).
initial
begin
$monitor("Time = %d, tb_in_0 = %b, tb_in_1 = %b,tb_sel = %b,tb_mux_out= %b",$time,tb_in_0,tb_in_1,tb_sel,tb_mux_out);
end
endmodule
