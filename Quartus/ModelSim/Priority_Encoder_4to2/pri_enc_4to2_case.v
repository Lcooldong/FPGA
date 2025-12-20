module pri_enc_4to2_case(a, valid, y);
    input  [3:0] a;
    output       valid;
    output [1:0] y;
    reg          valid;
    reg    [1:0] y;

    always @(a) begin
        valid = 1;
        casex(a)
            4'b1xxx : y = 3;
            4'b01xx : y = 2;
            4'b001x : y = 1;
            4'b0001 : y = 0;
            default : begin
                valid = 0;
                y = 2'bx;
            end
        endcase
    end
endmodule