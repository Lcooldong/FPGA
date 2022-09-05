`timescale 1ns/10ps
module tb_dec_2to4;
    reg  [1:0] a;
    wire [3:0] y;

    // dec_2to4_case U0(a, y);
    // dec_2to4_if U0(a, y);
    dec_2to4_for U0(a, y);

    always begin
            a = 2'b00;
        #20 a = 2'b01;
        #20 a = 2'b10;
        #20 a = 2'b11;
        #20;
    end
endmodule