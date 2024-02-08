`timescale 1ns / 1ps

//1) Display how many times timer in 1.6us, pattern was detected.
//2) Clk = 100MHz, & timer of 1.6us.
//3) sequence of 10110.
module pattern_detector(
 input clk,
 input arst,
 input seq_i,
 output reg [3:0]count
    );
    
    
    // timer
    wire timer_out;
    timer TI(.clk(clk),.arst(arst),.alarm_o(timer_out));
    
    // pattern
    wire seq_det_out;
    sequence_detector SD(.clk(clk),.rst(arst),.seq_i(seq_i),.detect_o(seq_det_out));
    
   // pattern counting logic
    always @(posedge clk)
     begin
       if(arst)
        begin
          count <= 0;
        end
      else
        begin
          if((!timer_out))
            begin
              if(seq_det_out)
                begin
                  count <= count + 1;
                end
            end
          else
            begin
              if(timer_out)
                begin
                  count <= 0;
                end
            end
        end
     end
     
endmodule
