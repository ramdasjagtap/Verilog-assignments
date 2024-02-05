`timescale 1ns/1ps

module tb_asyn_counter();
parameter N =10;
parameter WIDTH = 4;

reg tb_clk;
reg tb_arst;
reg tb_mode;
reg tb_load;
reg [WIDTH-1:0]tb_value;
wire [WIDTH-1:0]tb_count;

// module instance
 async_counter #(N,WIDTH) DUT(.clk(tb_clk),.arst(tb_arst),.mode(tb_mode),.load(tb_load),.value(tb_value),.count(tb_count));

 // clock
 initial
  begin
 	tb_clk = 1'b1;
	forever 
	  #5 tb_clk = ~tb_clk;
 end

 integer file;
 initial
	   begin
	   file = $fopen("counter.txt","w");
	   tb_arst <= 1'b1;
	   tb_mode <= 1'b0;
	   tb_load <= 1'b0;
	   tb_value <= 5;
	   #10;
	   tb_arst <= 1'b0;
	   tb_mode <= 1'b0;
	   #20;
	   tb_mode <= 1'b1;
	   tb_load <= 1'b1;
	   #100;
	   tb_mode <= 1'b0;
	   tb_load <= 1'b0;
	   #150 
	   tb_mode <= 1'b1;
	   #300;
	   $fclose(file);
	   $fdisplay(file,"Simulation over!");
	   $finish();
	  end

	  initial
		   begin
	  	$fmonitor(file,"tb_arst - %b | tb_mode - %b | tb_load - %b | tb_value - %d | tb_count - %d",tb_arst,tb_mode,tb_load,tb_value,tb_count);
	  end
endmodule