`timescale 1ns/10ps
module tb_nor;
	reg	[3:0] a, b;
	wire	[3:0] y;
	
	nor_gate U0(a, b, y);
	
	initial begin
		    a = 4'b0000; b = 4'b0000;
		#10 a = 4'b1010; b = 4'b0101;
		#10 a = 4'b1100; b = 4'b1100;
		#10 a = 4'b1011; b = 4'b0000;
		#10 a = 4'b1001; b = 4'b1000;
		#10 a = 4'b1111; b = 4'b0000;
		#10 a = 4'b0010; b = 4'b0111;
		#10 a = 4'b1101; b = 4'b0101;
		#10 a = 4'b0000; b = 4'b1101;
		#10 a = 4'b1111; b = 4'b1111;
		#10 a = 4'b0111; b = 4'b0100;
		#10;
	end
endmodule