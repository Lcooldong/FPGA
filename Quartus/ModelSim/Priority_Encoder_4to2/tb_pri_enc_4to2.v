`timescale 1ns/10ps
module tb_pri_enc_4to2;
    reg   [3:0] a;
    wire        valid;
    wire  [1:0] y;

    pri_enc_4to2_case U0(a, valid, y);
    // pri_enc_4to2_if U0(a, valid, y);
    // pri_enc_4to2_for U0(a, valid, y);

    always begin
            a = 4'b0001;
        #20 a = 4'b0010;
        #20 a = 4'b0100;
        #20 a = 4'b1000;
        #20;
    end
endmodule