`timescale 1ns/10ps
module tb_mux41;
    reg  [3:0] a, b, c, d;
    reg  [1:0] sel;
    wire [3:0] y;

    // mux41_if U0(sel, a, b, c, d, y);
    mux41_case U0(sel, a, b, c, d, y);
    // mux41_conop U0(sel, a, b, c, d, y);

    initial begin
        a = 4'b0001; b = 4'b0010;
        c = 4'b0100; d = 4'b1000;
        #80;
        a = 4'b1100; b = 4'b0011;
        c = 4'b0110; d = 4'b1001;
    end

    initial
        sel = 2'b00;
    
    always
        #20 sel = sel + 1;

endmodule