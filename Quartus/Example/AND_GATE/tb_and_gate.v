`timescale 1ns/10ps
module tb_and_gate;

	reg in1, in2;
	wire out1;
	
	and_gate uut(
		.in1(in1),
		.in2(in2),
		.out1(out1)
		);
	
		initial begin
			in1 = 0;
			in2 = 0;
			#100;
		end
		
	always#(100) begin
		in1 = ~in1;
	end
	
	always#(50) begin
		in2 = ~in2;
	end

endmodule