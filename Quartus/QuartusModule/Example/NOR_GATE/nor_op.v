module nor_op(a, b, y);
	input [3:0] a, b;
	output [3:0] y;
	
	assign y = ~(a | b);

endmodule