`timescale 1ns / 1ps

module tb_moore_machine();

reg tb_clk;
reg tb_reset;
reg tb_data;
reg tb_ack;
reg tb_done_counting;
wire tb_shift_ena;
wire tb_counting;
wire tb_done;

moore_machine DUT(.clk(tb_clk),.reset(tb_reset),.ack(tb_ack),.done_counting(tb_done_counting),.data(tb_data),.shift_ena(tb_shift_ena),.counting(tb_counting),.done(tb_done));

always #5 tb_clk = ~tb_clk;

integer i;
initial
 begin
  tb_reset <= 1'b1;
  tb_clk <= 1'b0;
  tb_data <= 0;
  tb_ack <= 0;
  tb_done_counting <= 0;
  #10;
  tb_reset <= 1'b0;
  for(i=0;i<512;i=i+1)
    begin
     tb_data <= $urandom_range(0,1);
     @(negedge tb_clk);
    end
    
    #100;
    $finish();
 end

endmodule
