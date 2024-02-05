`timescale 1ns / 1ps

// async counter
module async_counter 
#(parameter N = 4,
parameter WIDTH = 4)(
input clk,
input arst,
input mode,
input load,
input [WIDTH-1:0]value,
output reg [WIDTH-1:0]count
);
always @(posedge clk or posedge arst)
 begin   //1
   if (arst)
	   count <= 0;
   else
    begin  //2 
     if(mode)
      begin  //3
       if(load)
        count <= value;
       else
         begin //4
          if(count == N)
		  count <= 0;
          else
		  count <= count + 1;
         end//4
      end//3
     else
      begin//5
       if(load)
	       count <= value;
        else
         begin//6
          if(count == 0)
		  count <= N - 1;
           else
                 count <= count - 1;
         end//6
      end //5
   end
  end          
endmodule