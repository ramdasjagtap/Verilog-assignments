
`timescale 1ns/1ps

module moore_machine(
	input clk,
	input reset,
	input data,
	input ack,
	input done_counting,
	output shift_ena,
	output counting,
	output done
);

parameter S = 4'b0000,
	S1 = 4'b0001,
	S11 = 4'b0010,
	S110 = 4'b0011,
	B0 = 4'b0100,
	B1 = 4'b0101,
	B2 = 4'b0110,
	B3 = 4'b0111,
	COUNT = 4'b1000,
	WAIT = 4'b1001;

reg [4:0] state;
reg [4:0] nxt_state;

always @(posedge clk)
begin
	if(reset)
	begin
		state <= 4'b0000;
	end
	else
	begin
		state <= nxt_state;
	end
end

always @(*)
begin
	case(state)
		S: begin
			if(data)
				nxt_state = S1;
			else
				nxt_state = S;
		end

		S1: begin
			if(data)
				nxt_state = S11;
			else
				nxt_state = S;
		end

		S11: begin
			if(data)
				nxt_state = S11;
			else
				nxt_state = S110;
		end

		S110: begin
			if(data)
				begin
				 nxt_state = B0;
				end
		    else
		        nxt_state = S;
		end

		B0:begin
				nxt_state = B1;
		end
		
		B1:begin
				nxt_state = B2;
		end
		
		B2:begin
				nxt_state = B3;
		end
		
		B3:begin
				nxt_state = COUNT;
		end
		
		COUNT: begin
		     if(!done_counting)
		       begin
		         nxt_state = COUNT;
		       end
		    else
		      begin
		        nxt_state = WAIT;
		      end
		end
		
		WAIT: begin
		   if(ack == 0)
		     begin
		       nxt_state = WAIT;
		     end
		   else
		     begin
		       nxt_state = S;
		     end
		end
	endcase
end

assign shift_ena = (state == B0) || (state == B1) || (state == B2) || (state == B3);
assign counting = (state == COUNT);
assign done = (state == WAIT);

endmodule