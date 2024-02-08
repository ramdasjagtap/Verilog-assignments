`timescale 1ns / 1ps

module tb_moore_seq_1101();

reg tb_clk;
reg tb_rst;
reg tb_in;
wire tb_out;

// integers
integer i;
integer file;

// module instance
//mealy_seq_detect DUT(.clk(tb_clk),.rst(tb_rst),.in(tb_in),.out(tb_out));
moore_seq_1101 DUT(.clk(tb_clk),.arst(tb_rst),.in(tb_in),.out(tb_out));

//clock
always #5 tb_clk = ~tb_clk;


// stimulus
initial
 begin
  file = $fopen("Moore.txt","w");
   tb_clk = 1'b0;
   tb_rst = 1'b1;
   tb_in = 1'b0;
   #10
   tb_rst = 1'b0;
    @(posedge tb_clk);
   for(i=0;i<512;i=i+1)
     begin
      tb_in = $urandom_range(0,1);
      @(posedge  tb_clk);
     end
     
     #10;
     $fclose(file);
     $fdisplay(file,"Simulation over!!");
     $finish();
 end
 
 initial
  begin
   $fmonitor(file,"Time- %d | tb_rst - %b | tb_in - %b | tb_out - %b",$time,tb_rst,tb_in,tb_out);
  end
endmodule