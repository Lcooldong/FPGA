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

parameter POSI