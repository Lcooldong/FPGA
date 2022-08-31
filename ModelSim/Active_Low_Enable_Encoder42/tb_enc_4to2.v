`timescale 1ns/10ps
module tb_enc_4to2;
    reg  [3:0] a;
    reg        en;
    wire [1:0] y;

    // enc_4to2_case U0(a, en, y);
    enc_4to2_if u0(a, en, y);
    // enc_4to2_for U0(a, en, y);

    always begin
        en = 1;
            a = 4'b0001;
        #20 a = 4'b0010;
        #20 a = 4'b0100;
        #20 a = 4'b1000;
        #20;
        en = 0;
        a = 4'b0001;
        #20 a = 4'b0010;
        #20 a = 4'b0100;
        #20 a = 4'b1000;
        #20;
    end

endmodule