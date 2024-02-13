`timescale 1ns / 1ps

// parameterized true RAM.

module tb_parameterizedRAM();

parameter WIDTH= 8;
parameter DEPTH = 32;
parameter ADDR_W = 6;

reg tb_clk_0,tb_clk_1;
reg tb_clr_0,tb_clr_1;
reg tb_en_0,tb_en_1;
reg tb_out_en_0,tb_out_en_1;
reg tb_ReadWrite_0,tb_ReadWrite_1;
reg [ADDR_W-1:0] tb_address_0,tb_address_1;
reg [WIDTH-1:0] data_0;
reg [WIDTH-1:0] data_1;
wire [WIDTH-1:0] tb_data_0;
wire [WIDTH-1:0] tb_data_1;

truedualportRAM #(WIDTH,DEPTH,ADDR_W) DUT(.clk_0(tb_clk_0),.clk_1(tb_clk_1),.clr_0(tb_clr_0),.clr_1(tb_clr_1),.en_0(tb_en_0),.en_1(tb_en_1),.out_en_0(tb_out_en_0),.out_en_1(tb_out_en_1),.ReadWrite_0(tb_ReadWrite_0),.ReadWrite_1(tb_ReadWrite_1),.address_0(tb_address_0),.address_1(tb_address_1),.data_0(tb_data_0),.data_1(tb_data_1));

//clock-0
always #5 tb_clk_0 = ~tb_clk_0;
assign tb_data_0 = (tb_out_en_0)?data_0:'hzz;
//clock-1
always #10 tb_clk_1 = ~tb_clk_1;
assign tb_data_1 = (tb_out_en_1)?data_1:'hzz;


integer i;
// stimulus
initial
  begin
  tb_clr_0 <= 1'b1;
  tb_clr_1 <= 1'b1;
  tb_clk_0 <= 1'b0;
  tb_clk_1 <= 1'b0;
  data_0 <= 0;
  data_1 <= 0;
  tb_en_0 <= 1'b0;
  tb_en_1 <= 1'b0;
  tb_ReadWrite_0 <= 1'b1;
  tb_ReadWrite_1 <= 1'b0;
  tb_out_en_0 <= 1'b0;
  tb_out_en_1 <= 1'b0;
  tb_address_0 <= 0;
  tb_address_1 <= 0;
  #10;
  tb_clr_0 <= 1'b0;
  tb_clr_1 <= 1'b0;
  data_0 <= 8'hAA;
  data_1 <= 8'hFF;
  tb_ReadWrite_0 <= 1'b0;
  tb_en_0 <= 1'b1;
  
  // Writing data
  for(i=0;i<32;i=i+1)
    begin
     @(negedge tb_clk_0);
     @(negedge tb_clk_0);
     tb_address_0 <= $urandom_range(0,32);
    end
    #50;
    tb_out_en_0 <= 1'b1;
    tb_out_en_1 <= 1'b1;
    #100;
    
    tb_ReadWrite_0 <= 1'b1;
    tb_en_1 <= 1'b1;
    tb_ReadWrite_1 <= 1'b1;
    // Reading data
    for(i=0;i<32;i=i+1)
      begin
       @(negedge tb_clk_1);
       @(negedge tb_clk_1);
       @(negedge tb_clk_1);
       @(negedge tb_clk_1);
       tb_address_1 <= $urandom_range(0,32);
      end
    #120;
    $finish();
  end

endmodule
