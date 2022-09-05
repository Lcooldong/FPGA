module pri_enc_4to2_for(a, valid, y);
    input  [3:0] a;
    output       valid;
    output [1:0] y;
    reg          valid;
    reg    [1:0] y;
    integer      n;

    always @(a) begin :Loop
        valid = 0;
        y = 2'bx;
        for (n = 3; n >= 0 ; n = n-1)
            if(a[n]) begin
                valid = 1;
                y = n;
                disable Loop;
            end
    end
endmodule