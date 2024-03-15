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
  input cs_wr,
  input cs_rd,
  input [7:0] data_in,
  output [7:0] data_out,
  output full,
  output empty,
  output almost_full,
  output almost_empty
);

  // Write pointer.
  reg [ADDR_W:0]wptr;

  // Read Pointer 
  reg [ADDR_W:0]rptr;
  
  // counter
  reg [ADDR_W:0]count;
  
  // writing data form port - 0 
  truedualportRAM #( WIDTH,DEPTH,ADDR_W) RAM(
  .clk(clk),
  .en_0(wr_en),
  .en_1(rd_en),
  .out_en_0(1'b0),
  .out_en_1(!empty),
  .ReadWrite_0(!wr_en),  // writing of data (0)
  .ReadWrite_1(rd_en),
  .address_0(wptr),
  .address_1(rptr),
  .data_0(data_in),
  .data_1(data_out)
  );
  
 // reset block.
  always @(posedge clk)
   begin
    if(rst)
      begin
        wptr <= 0;
        rptr <= 0;
        count <= 0;
      end
   end
   
   // writing of data
   always @(posedge clk)
     begin
       if(wr_en && !full)
          begin
            if(wptr == DEPTH)
              begin
                wptr <= 0;
              end
            else
              begin
                wptr <= wptr + 1;
              end
          end
     end
         
         // reading of data.
          always @(posedge clk)
          begin
            if(rd_en && !empty)
             begin
              if(rptr == DEPTH)
                begin
                  rptr <= 0;
                end
              else
                begin
                  rptr <= rptr + 1;
                end
            end
           end
   
          // Read with no write.
          always @(posedge clk)
            begin
              if(rd_en && !wr_en && !empty)
             begin
               if(count != 0)
                 begin
                   count <= count - 1;
                 end
               else if(count  == DEPTH )
                 begin
                     count <= 1;
                 end
             end
            end
            
            //write with no read;
            always @(posedge clk)
              begin
                if(wr_en && !rd_en && !full)
              begin
                if(count != DEPTH)
                 begin
                   count <= count + 1;
                 end
                else if(count  == DEPTH)
                 begin
                     count <= 1;
                 end
              end
            end
            
        // read with write
     always @(posedge clk)
       begin
         if(rd_en && wr_en)
           begin
             if(wptr == DEPTH && rptr == DEPTH)
               begin
                     wptr <= 0;
                     rptr <= 0;
               end
             else if(count  == DEPTH)
                 begin
                     count <= 1;
                 end
             else
               begin
                 count <= count + 1;
               end
           end
       end
   
   assign full =  (wptr[ADDR_W-1:0] == rptr[ADDR_W-1:0]) && (wptr[ADDR_W] ^ rptr[ADDR_W]);
   assign empty = (wptr == rptr);
   
   assign almost_full = ((wptr-rptr) >= (DEPTH - 4));
   assign almost_empty = ((wptr-rptr) <= 4);
      
endmodule
