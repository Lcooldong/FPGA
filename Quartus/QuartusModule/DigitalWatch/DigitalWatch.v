module DigitalWatch(
	reset,
	clk,
	sw0,
	sw1,
	sw2,
	hourFNDSel2,
	hourFNDSel1,
	minFNDSel2,
	minFNDSel1,
	secFNDSel2,
	secFNDSel1,
	hourFND,
	minFND,
	secFND,
	mode,
	set_pos
);


input wire reset;
input wire clk;
input wire sw0;
input wire sw1;
input wire sw2;
output wire hourFNDsel2;
output wire hourFNDsel1;
output wire minFNDsel2;
output wire minFNDsel1;
output wire secFNDsel2;
output wire secFNDsel1;

output wire [6:0] hourFND;
output wire [6:0] minFND;
output wire       mode;
output wire [6:0] secFND;
output wire [2:0] set_pos;

wire blink;
wire clk100hz;
wire clk1hz;
wire clk2hz;
wire [4:0] hour_out;
wire [5:0] min_out;
wire 		  mode_ALTERA_SYNTHESIZED;
wire [5:0] sec_out;
wire [2:0] set_pos_ALTERA_SYTHESIZED;

parameter POSITION_HOUR=3'b100, POSITION_MINUTE=3'b010;
parameter POSITION_SECOND=3'b001, POSITION_NONE=3'b000;
parameter MODE_NORMAL=1'b0, MODE_SETTING=1'b1;

MasterSelect b2v_inst(
	.reset(reset),
	.clk(clk),
	.sw0(sw0),
	.sw1(sw1),
	.clk1hz_out(clk1hz),
	.clk2hz_out(clk2hz),
	.clk100hz_out(clk100hz),
	.mode_out(mode_ALTERA_SYNTHESIZED),
	.set_pos_out(set_pos_ALTERA_SYTHESIZED));
	

DigitalClock b2v_inst1(
	.reset(reset),
	.clk(clk),
	.clk1hz_out(clk1hz),
	.clk2hz_out(clk2hz),
	.blink(blink),
	.sw2(sw2),
	.clk100hz_out(clk100hz),
	.mode_out(mode_ALTERA_SYNTHESIZED),
	.set_pos_out(set_pos_ALTERA_SYTHESIZED),
	.hour_out(hour_out),
	.min_out(min_out),
	.sec_out(sec_out));

	
FNDDisplay	b2v_inst2(
	.reset(reset),
	.clk(clk),
	.clk2hz_out(clk2hz),
	.clk100hz_out(clk100hz),
	.sw2(sw2),
	.dc_hour(hour_out),
	.dc_min(min_out),
	.dc_sec(sec_out),
	.mode(mode_ALTERA_SYNTHESIZED),
	.set_pos(set_pos_ALTERA_SYTHESIZED),
	.hourFNDsel2(hourFNDsel2),
	.hourFNDsel1(hourFNDsel1),
	.minFNDsel2(minFNDsel2),
	.minFNDsel1(minFNDsel1),
	.secFNDsel2(secFNDsel2),
	.secFNDsel1(secFNDsel1),
	.blink_out(blink),
	.hourFND(hourFND),
	.minFND(minFND),
	.secFND(secFND));

	
assign mode = mode_ALTERA_SYNTHESIZED;
assign set_pos = set_pos_ALTERA_SYTHESIZED;

defparam b2v_inst.POSITION_HOUR_LOCAL = POSITION_HOUR;
defparam b2v_inst.POSITION_MINUTE_LOCAL = POSTION_MINUTE;
defparam b2v_inst.POSITION_SECOND_LOCAL = POSITION_SECOND;

defparam b2v_inst.MODE_NORNAL_LOCAL = MODE_NORMAL;
defparam b2v_inst.MODE_SETTING_LOCAL = MODE_SETTING;

defparam b2v_inst1.POSITION_HOUR_LOCAL = POSITION_HOUR;
defparam b2v_inst1.POSITION_MINUTE_LOCAL = POSITION_MINUTE;
defparam b2v_inst1.POSITION_SECOND_LOCAL = POSITION_SECOND;
defparam b2v_inst1.POSITION_NONE_LOCAL = POSITION_NONE;

defparam b2v_inst1.MODE_NORMAL_LOCAL = MODE_NORMAL;
defparam b2v_inst1.MODE_SETTING_LOCAL = MODE_SETTING;

defparam b2v_inst2.s0 = 2'b00;
defparam b2v_inst2.s1 = 2'b01;
defparam b2v_inst2.s2 = 2'b10;

defparam b2v_inst2.POSITION_HOUR_LOCAL = POSTION_HOUR;
defparam b2v_inst2.POSITION_MINUTE_LOCAL = POSITION_MINUTE;
defparam b2v_inst2.POSITION_SECOND_LOCAL = POSITION_SECOND;

defparam b2v_inst2.MODE_NORMAL_LOCAL = MODE_NORMAL;
defparam b2v_inst2.MODE_SETTING_LOCAL = MODE_SETTING;

endmodule

