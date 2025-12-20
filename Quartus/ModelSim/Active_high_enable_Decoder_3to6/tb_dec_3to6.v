`timescale 1ns/10ps
module tb_dec_3to6;
    reg  [2:0] a;
    reg        en;
    wire [5:0] y;


    dec_3to6_case U0(en, a, y);

    always begin
        en = 0;
            a = 3'b000;
        #10 a = 3'b001;
        #10 a = 3'b010;
        #10 a = 3'b011;
        #10 a = 3'b100;
        #10 a = 3'b101;
        #10 a = 3'b110;
        #10 a = 3'b111;
        #10;
        en = 1;
            a = 3'b000;
        #10 a = 3'b001;
        #10 a = 3'b010;
        #10 a = 3'b011;
        #10 a = 3'b100;
        #10 a = 3'b101;
        #10 a = 3'b110;
        #10 a = 3'b111;
        #10;
    end
endmodule