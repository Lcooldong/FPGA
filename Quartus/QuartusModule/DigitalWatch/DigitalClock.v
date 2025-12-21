`timescale 1ns / 1ps
module DigitalClock(reset, clk, clk1hz, clk2hz, blink, mode, set_pos, sw2, 
							sec_out, min_out, hour_out);
							
	input				reset, clk, clk1hz, clk2hz;
	input				blink;
	input				mode;
	input	 [2:0]	set_pos;
	input				sw2;
	
	output [5:0]	sec_out, min_out;
	output [4:0]	hour_out;
	
	reg				timeClock;
	reg	 [4:0]	hour;
	reg	 [5:0]	min, sec;
	
	parameter POSITION_HOUR_LOCAL=3'b100, POSITION_MINUTE_LOCAL=3'b010;
	parameter POSITION_SECOND_LOCAL=3'b001, POSITION_NONE_LOCAL=3'b000;
	parameter MODE_NORMAL_LOCAL=1'b0, MODE_SETTING_LOCAL=1'b1;
	
	//always for clock source
	always @ (posedge (clk)) begin
		if (mode == 1'b1)
			if (blink == 1'b1)
				timeClock <= sw2;
			else 
				timeClock <= clk2hz;
		else
			timeClock <= clk1hz;
	end
	
	
	// always for second
	always @ (posedge (timeClock) or negedge reset) begin
		if (~reset)
			sec <= 6'd0;
		else
			case (mode)
				MODE_NORMAL_LOCAL :
					if (sec >= 6'd59)
						sec <= 6'd0;
					else
						sec <= sec + 1'b1;
				MODE_SETTING_LOCAL :
					if (set_pos == POSITION_SECOND_LOCAL) begin 
						if (sec >= 6'd59)
							sec <= 6'd0;
						else
							sec <= sec + 1'b1;
					end
			endcase
	end
	
	//always for minute
	always @ (posedge (timeClock) or negedge reset) begin
		if (~reset)
			min <= 6'd0;
		else
			case (mode)
				MODE_NORNAL_LOCAL :
					if (sec >= 6'59) begin
						if (min >= 6'd59)
							min <= 6'd0;
						else
							min <= min + 1'b1;
					end
				
				MODE_SETTING_LOCAL :
					if (set_pos == POSITION_MINUTE_LOCAL) begin
						if (min >= 6'd59)
							min <= 6'd0;
						else
							min <= min + 1'b1;
				   end
			endcase
	end
	
	// always for hour
	always @ (posedge (timeClock) or negedge reset) begin
		if (~reset)
			hour <= 5'd0;
		else
			case (mode)
				MODE_NORMAL_LOCAL :
					if (sec >= 6'd59) begin
						if (min >= 6'd59) begin
							if (hour >= 5'd23)
								hour <= 5'd0;
							else
								hour <= hour + 1'b1;
						end
					end
				
				MODE_SETTING_LOCAL :
					if (set_pos == POSITION_HOUR_LOCAL) begin
						if (hour >= 6'd59)
							hour <= 6'd0;
						else
							hour <= hour + 1'b1;
					end
			endcase
	end
	assign sec_out = sec;
	assign min_out = min;
	assign hour_out = hour;
endmodule	
	
	
		