module enc_4to2_case (a, en, y);
    input  [3:0] a;
    input        en;
    output [1:0] y;
    reg    [1:0] y;

    always @(a, en) begin
        casex(a)
            4'b0001 : y = 0;
            4'b0010 : y = 1;
            4'b0100 : y = 2;
            4'b1000 : y = 3;
            default : y = 2'bx;
        endcase
        y = y * en;
    end
endmodule