`timescale 1ns / 1ps
module MasterSelect(reset, clk, sw0, sw1, 
			clk1hz_out, clk2hz_out, mode_out, set_pos_out, clk100hz_out);
	
		parameter POSITION_HOUR_LOCAL=3'b100, POSITION_MINUTE_LOCAL=3'b010;
		parameter POSITION_SECOND_LOCAL=3'b001, POSITION_NONE_LOCAL=3'b000;
		parameter MODE_NORMAL_LOCAL=1'b0, MODE_SETTING_LOCAL=1'b1;
		
		input				reset, clk;
		input 			sw0, sw1;
		output			mode_out;
		output [2:0]	set_pos_out;
		output			clk1hz_out, clk2hz_out, clk100hz_out;
		
		reg [2:0]		set_pos_out;
		
		integer			cnt1hz, cnt2hz, cnt100hz = 0;
		reg [2:0]		set_pos = POSITION_SECOND_LOCAL;
		reg				mode = MODE_NORMAL_LOCAL;
		reg				clk1hz, clk2hz, clk100hz;
		
		always @ (posedge (sw0) or negedge reset) begin
			if (~reset)
				mode <= MODE_NORMAL_LOCAL;
			else
				mode <= mode + 1'b1;
		end
		
		assign mode_out = mode;
		
		always @ (posedge (sw1) or negedge reset) begin
			if (~reset)
				set_pos <= POSITION_HOUR_LOCAL;
			else
				if (mode == MODE_SETTINNG_LOCAL)
					case(set_pos)
						POSITION_HOUR_LOCAL   : set_pos <= POSITION_MINUTE_LOCAL;
						POSITION_MINUTE_LOCAL : set_pos <= POSITION_SECOND_LOCAL;
						POSITION_SECOND_LOCAL : set_pos <= POSITION_HOUR_LOCAL;
					
					endcase
				else
					set_pos <= POSITION_NONE_LOCAL;
		
		
		// LED output select change
		always @ (mode or set_pos) begin
			case(mode)
				MODE_SETTING_LOCAL :
					set_pos_out <= set_pos;
				default :
					set_pos_out <= POSITION_NONE_LOCAL;
			endcase
		end
			
		// 1Hz clock generation
		always @ (posedge (clk)) begin
			if (cnt1hz >= 499999) begin
				cnt1hz <= 0;
				clk1hz <= ~clk1hz;
			end else
				cnt1hz <= cnt1hz+1;
		end
		assign clk1hz_out = clk1hz;
		
		// 2Hz clock generation
		always @ (posedge (clk)) begin
			if (cnt2hz >= 249999) begin
				cnt2hz <= 0;
				clk2hz <= ~clk2hz;
			end else
				cnt2hz <= cnt2hz+1;
		end
		assign clk2hz_out = clk2hz; 
		
		
		// 100Hz clock generation
		always @ (posedge (clk)) begin
			if (cnt100hz >= 4999) begin
				cnt100hz <= 0;
				clk100hz <= ~clk100hz;
			end else
				cnt100hz <= cnt100hz+1;
		end
		assign clk100hz_out = clk100hz;
		
		
endmodule