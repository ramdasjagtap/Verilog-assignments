`timescale 1ns / 1ps

// testbench
module tb_improvised_memory();

reg tb_clk;
reg tb_arst;
reg tb_enable;
reg [3:0]tb_address_x;  //horizontal.
reg [6:0]tb_address_y;
reg tb_ReadWrite;
reg [7:0]tb_data_in;
wire [7:0]tb_data_out;

// integer declaration.
integer i;

// module instance
improvised_memory DUT(.clk(tb_clk),.arst(tb_arst),.enable(tb_enable),.address_x(tb_address_x),.address_y(tb_address_y),.ReadWrite(tb_ReadWrite),.data_in(tb_data_in),.data_out(tb_data_out));

// clock
always #5 tb_clk = ~tb_clk;


// stimulus.
initial
 begin 
 tb_arst <= 1'b1;
 tb_clk <= 1'b0;
 tb_enable <= 1'b0;
 tb_address_x <= 0;
 tb_address_y <= 0;
 tb_ReadWrite <= 1'b0;
 tb_data_in <= 0;
 #10;
 tb_arst <= 1'b0;
 #10;
 tb_enable <= 1'b1;
 #5
 //Writing data
 //tb_data_in <= 8'hAA;
 for(i=0;i<64;i=i+1)
   begin
     tb_address_x <= $urandom_range(0,31);
     tb_address_y <= $urandom_range(0,63);
     tb_data_in <= $urandom_range(0,8'hFF);
     @(negedge tb_clk);
     @(negedge tb_clk);
   end
   
   #20;
   // Reading data;
   tb_ReadWrite <= 1'b1;
    for(i=0;i<64;i=i+1)
     begin
     @(negedge tb_clk);
     @(negedge tb_clk);
     tb_address_x <= $urandom_range(0,31);
     tb_address_y <= $urandom_range(0,63);
     @(negedge tb_clk);
   end
   #100;
   $finish();
   
 end

endmodule
