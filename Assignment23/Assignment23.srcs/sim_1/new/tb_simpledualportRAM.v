`timescale 1ns / 1ps

module tb_simpledualportRAM();

parameter WIDTH= 8;
parameter DEPTH = 32;
parameter ADDR_W = 6;

reg tb_clk;
reg tb_clr_0,tb_clr_1;
reg tb_en_0,tb_en_1;
reg tb_Write_0,tb_Read_1;
reg [ADDR_W-1:0] tb_address_0,tb_address_1;
reg [WIDTH-1:0] tb_data_in;
wire [WIDTH-1:0] tb_data_out;


integer i;

//simpledualportRAM DUT(.clk_0(tb_clk_0),.clk_1(tb_clk_1),.clr_0(tb_clr_0),.clr_1(tb_clr_1),.en_0(tb_en_0),.en_1(tb_en_1),.Write_0(tb_Write_0),.Read_1(tb_Read_1),.address_0(tb_address_0),.address_1(tb_address_1),.data_in(tb_data_in),.data_out(tb_data_out));
parameterizedRAM #(WIDTH,DEPTH,ADDR_W) DUT(.clk(tb_clk),.clr_0(tb_clr_0),.clr_1(tb_clr_1),.en_0(tb_en_0),.en_1(tb_en_1),.Write_0(tb_Write_0),.Read_1(tb_Read_1),.address_0(tb_address_0),.address_1(tb_address_1),.data_in(tb_data_in),.data_out(tb_data_out));

always #5 tb_clk = ~tb_clk;

//always #10 tb_clk_1 = ~tb_clk_1;

initial
 begin
  tb_clr_0 <= 1'b1;
  tb_clr_1 <= 1'b1;
  tb_clk <= 1'b0;
  //tb_clk_1 <= 1'b0;
  tb_data_in <= 0;
  tb_en_0 <= 1'b0;
  tb_en_1 <= 1'b0;
  tb_Write_0 <= 1'b1;
  tb_Read_1 <= 1'b0;
  tb_address_0 <= 0;
  tb_address_1 <= 0;
  #10;
  tb_clr_0 <= 1'b0;
  tb_clr_1 <= 1'b0;
  tb_data_in <= 8'hAA;
  tb_Write_0 <= 1'b0;
  tb_en_0 <= 1'b1;
  
  // Writing data
  for(i=0;i<32;i=i+1)
    begin
     @(negedge tb_clk);
     @(negedge tb_clk);
     tb_address_0 <= $urandom_range(0,32);
    end
    #50;
    
    tb_Write_0 <= 1'b1;
    tb_en_1 <= 1'b1;
    tb_Read_1 <= 1'b1;
    // Reading data
    for(i=0;i<32;i=i+1)
      begin
       @(negedge tb_clk);
       @(negedge tb_clk);
       @(negedge tb_clk);
       @(negedge tb_clk);
       tb_address_1 <= $urandom_range(0,32);
      end
    
    #100;
    $finish();
 end

endmodule
