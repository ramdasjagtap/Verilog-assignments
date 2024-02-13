`timescale 1ns / 1ps

// test cases
module tb_RAM16x8();
 // parameters
  parameter ADDR_WIDTH = 5;
  parameter RAM_WIDTH = 8;
  parameter RAM_DEPTH = 16;
  
  // wires and regs
reg tb_clk;
reg tb_cs;
reg tb_enable;
reg tb_out_en;
reg tb_ReadWrite;
reg [ADDR_WIDTH-1:0]tb_address;
reg [RAM_WIDTH-1:0]tb_data;
wire [RAM_WIDTH-1:0]data;

integer i;

// module instance
RAM16x8 DUT(.clk(tb_clk),.cs(tb_cs),.enable(tb_enable),.out_en(tb_out_en),.ReadWrite(tb_ReadWrite),.address(tb_address),.data(data));
//parameterized_RAM #(ADDR_WIDTH,RAM_WIDTH,RAM_DEPTH) DUT(.clk(tb_clk),.cs(tb_cs),.enable(tb_enable),.out_en(tb_out_en),.ReadWrite(tb_ReadWrite),.address(tb_address),.data(data));

// clock
always #5 tb_clk = ~tb_clk;

assign data = (!tb_out_en)?tb_data:'hzz;


// stimulus
initial
 begin
  tb_clk <= 1'b0;
  tb_cs <= 1'b0;
  tb_enable <= 1'b0;
  tb_data <= 0;
  tb_address <= 0;
  tb_ReadWrite <= 0;
  tb_out_en <= 1'b0;
   #10;
   tb_cs <= 1'b1;
   tb_enable <= 1'b1;
   tb_address <= 'h0000;
   #10;
   tb_data <= 'hAA;
   for(i=0;i<256;i=i+1)
     begin
        tb_address <= $urandom_range(0,4'hF);
        @(negedge tb_clk);
        @(negedge tb_clk);
     end
     #20;
     
     tb_data <= 'hDC;
     for(i=0;i<256;i=i+1)
     begin
        tb_address <= $urandom_range(0,4'hF);
        @(negedge tb_clk);
        @(negedge tb_clk);
     end
     
    #20;
    
     tb_out_en <= 1'b1;
     for(i=0;i<256;i=i+1)
     begin
        tb_address <= $urandom_range(0,4'hF);
        @(negedge tb_clk);
        @(negedge tb_clk);
     end
     #20;
     $finish();
 end

endmodule
