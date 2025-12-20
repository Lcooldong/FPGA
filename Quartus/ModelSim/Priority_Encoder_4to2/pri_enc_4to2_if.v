module pri_enc_4to2_if(a, valid, y);
    input   [3:0] a;
    output        valid;
    output  [1:0] y;
    reg           valid;
    reg     [1:0] y;

    always @(a) begin
        valid = 1;
        if      (a[3]) y = 3;
        else if (a[2]) y = 2;
        else if (a[1]) y = 1;
        else if (a[0]) y = 0;
        else begin
            valid = 0;
            y = 2'bx;
        end
    end
endmodule