`timescale 1ns / 1ps


module tb_improvisation_1();

reg tb_clk;
reg tb_arst_n;
reg [15:0] tb_data_in;
wire [31:0] tb_data_out;
wire tb_done;

// module instance
improvisation1 DUT(.clk(tb_clk),.arst_n(tb_arst_n),.data_in(tb_data_in),.data_out(tb_data_out),.done(tb_done));

//clock 
always #5 tb_clk = ~tb_clk;


//stimulus
initial
  begin
    tb_arst_n <= 1'b0;
    tb_clk <= 1'b0;
    tb_data_in <= 0;
    #10;
    tb_arst_n <= 1'b1;
    tb_data_in <= 'h05;
    #20
    tb_data_in <= 'h04;
    #30;
   // tb_data_in <= 5;
    #100;
    $finish();
  end
  
  // example 
  // A = 5  & B = 4
  // result = A*B = 20;
  
  // monitor window;
  initial
   begin
    $monitor("Time - %d | tb_data_in - %d | tb_arst_n - %b | tb_data_out - %d",$time,tb_data_in,tb_arst_n,tb_data_out);
   end
endmodule
