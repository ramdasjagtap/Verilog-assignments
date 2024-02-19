`timescale 1ns / 1ps


module tb_testing();

reg tb_clk;
wire tb_eqz;
//reg tb_arst_n;
reg tb_ldB;
reg tb_decB; 
reg tb_ldA;
reg tb_ldP;
reg tb_clrP;
//wire tb_done;
reg [15:0]tb_data_in;
wire [32:0]tb_data_out;

//controller1 DUT(.clk(tb_clk),.eqz(tb_eqz),.arst_n(tb_arst_n),.decB(tb_decB),.ldA(tb_ldA),.ldB(tb_ldB),.ldP(tb_ldP),.clrP(tb_clrP),.done(tb_done));

datapath1 DUT(
    .clk(tb_clk),
    .data_in(tb_data_in),
    .ldA(tb_ldA),
    .ldB(tb_ldB),
    .ldP(tb_ldP),
    .clrP(tb_clrP),
    .decB(tb_decB),
    .data_out(tb_data_out),
    .eqz(tb_eqz)
);

always #5 tb_clk = ~tb_clk;

initial
  begin
    tb_clk <= 1'b0;
    #5;
    tb_ldA <= 0;
    tb_ldB <= 0;
    tb_ldP <= 0;
    tb_clrP <= 0;
    tb_decB <= 0;
    #15;
     tb_data_in <= 'h05;
    tb_ldA = 1'b1;
    #25;
    tb_data_in <= 'h04;
     tb_ldA = 1'b0;
     tb_ldB = 1'b1;
     tb_clrP = 1'b1;
     tb_ldP = 1'b0;
     #35;
     tb_ldA = 1'b0;
     tb_ldB = 1'b0;
     tb_clrP = 1'b0;
     tb_ldP = 1'b1;
     tb_decB = 1'b1;
   #100;
   $finish();
  end
endmodule
