`timescale 1ns / 1ps

// improvised FIFO
// dual port RAM is used.
module improvisedFIFO
#(parameter WIDTH= 8,
parameter DEPTH = 16,
parameter ADDR_W = 4)(
  input clk,
  input rst,
  input wr_en,
  input rd_en,
  input [7:0] data_in,
  output [7:0] data_out,
  output full,
  output empty,
  output almost_full,
  output almost_empty
);

  // Write pointer.
  reg [3:0]wptr;

  // Read Pointer 
  reg [3:0]rptr;
  
  // counter
  reg [3:0]count;
  
  // writing data form port - 0 
  truedualportRAM #( WIDTH,DEPTH,ADDR_W) RAM(
  .clk(clk),
  .en_0(wr_en),
  .en_1(rd_en),
  .out_en_0(1'b0),
  .out_en_1(1'b1),
  .ReadWrite_0(wr_en),  // writing of data
  .ReadWrite_1(rd_en),
  .address_0(wptr),
  .address_1(rptr),
  .data_0(data_in),
  .data_1(data_out)
  );
  
  // writing of data
  always @(posedge clk)
   begin
    if(rst)
      begin
        wptr <= 0;
        rptr <= 0;
        count <= 0;
      end
    else
      begin
        if(wr_en)
          begin
            if(wptr == DEPTH - 1)
              begin
                wptr <= 0;
              end
            else
              begin
                wptr <= wptr + 1;
              end
          end
          // Read
          if(rd_en)
             begin
              if(rptr == DEPTH-1)
                begin
                  rptr <= 0;
                end
              else
                begin
                  rptr <= rptr + 1;
                end
           end
           //Read with no write
           if(rd_en && !wr_en)
             begin
               if(count != 0)
                 begin
                   count <= count - 1;
                 end
             end
             
             //write with no read;
             if(wr_en && !rd_en)
              begin
                if(count != DEPTH)
                 begin
                   count <= count + 1;
                 end
              end
      end
   end
   
   assign full = (count == DEPTH) || (count == DEPTH-1 && wr_en && !rd_en);
   assign empty = (count == 0);
   assign almost_full = (count > DEPTH - 5);
   assign almost_empty = (count < 4);
   
endmodule
