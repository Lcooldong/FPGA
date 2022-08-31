module enc_4to2_for(a, y);
    input  [3:0] a;
    output [1:0] y;
    reg    [1:0] y;
    reg    [3:0] temp;
    integer n;

    always @(a) begin
        temp = 4'b0001;
        y = 2'bx;
        for (n = 0; n < 4; n = n + 1) begin
            if(a == temp)
                y = n;
            temp = temp << 1;
        end
    end
endmodule