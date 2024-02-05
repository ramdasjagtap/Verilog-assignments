`timescale 1ns / 1ps

//Testbench for Basic and gates uisng assign 
//Module  instance
module tb_basic_gates_assign();
reg a_in;
reg b_in;
wire and_out;
wire or_out;
wire xor_out;
wire anot_out;
wire bnot_out;
wire nand_out;
wire nor_out;
wire xnor_out;


//Module instantiate
basic_gates_assign DUT(.a_in(a_in),.b_in(b_in),.and_out(and_out),.or_out(or_out),.xor_out(xor_out),.anot_out(anot_out),.bnot_out(bnot_out),.nand_out(nand_out),.nor_out(nor_out),.xnor_out(xnor_out));

//generating stimulus
initial
begin
    a_in <= 1'b0;
    b_in <= 1'b0;
    #20;

    a_in <= 1'b0;
    b_in <= 1'b1;
    #20;

    a_in <= 1'b1;
    b_in <= 1'b0;
    #20;

    a_in <= 1'b1;
    b_in <= 1'b1;
    #20;
    $finish();
end

//moniter window
initial
begin
    $monitor ("T=%t |a_in=%b |b_in=%b |and_out=%b |or_out=%b |xor_out=%b | anot_out=%b |bnot_out=%b |xnor_out=%b | nand_out=%b |nor_out=%b", $time, a_in, b_in, and_out, or_out, xor_out,anot_out,bnot_out,xnor_out,nand_out,nor_out);  
end
endmodule