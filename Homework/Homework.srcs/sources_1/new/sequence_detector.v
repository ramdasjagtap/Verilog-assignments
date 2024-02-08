
`timescale 1ns / 1ps

// Non-overlapping sequence detector (MEALY MACHINE)
// sequence -> 10110
module sequence_detector(
 input clk,
 input rst,
 input seq_i,
 output reg detect_o
    );
    
    // states
    parameter A = 3'b000,
	    B = 3'b001,
	    C = 3'b010,
	    D = 3'b011,
	    E = 3'b100;

    // reg
    reg [2:0]state;
    reg [2:0]nxt_state;
    always @(posedge clk)
    begin
     if(rst)
       begin
         detect_o <= 1'b0;
         state <= A;
       end
       else
       begin
	       state <= nxt_state;
       end
    end

    always @(clk,rst,seq_i)
    begin
    	case(state)
		A: begin
			if(seq_i)
			begin
				nxt_state <= B;
				detect_o <= 1'b0;
			end
			else
			begin
				nxt_state <= A;
				detect_o <= 1'b0;
			end
		end

		B: begin
			if(seq_i)
			begin
				nxt_state <= B;
				detect_o <= 1'b0;
			end
			else
			begin
				nxt_state <= C;
				detect_o <= 1'b0;
			end
		end

		C: begin
			if(seq_i)
			begin
				nxt_state <= D;
				detect_o <= 1'b0;
			end
			else
			begin
				nxt_state <= A;
				detect_o <= 1'b0;
			end
		end

		D: begin
			if(seq_i)
			begin
				nxt_state <= E;
				detect_o <= 1'b0;
			end
			else
			begin
				nxt_state <= C;
				detect_o <= 1'b0;
			end
		end

		E: begin
			if(seq_i)
			begin
				nxt_state <= B;
				detect_o <= 1'b0;
			end
			else
			begin
				nxt_state <= A;
				detect_o <= 1'b1;
			end
		end
	endcase
    end
    
endmodule