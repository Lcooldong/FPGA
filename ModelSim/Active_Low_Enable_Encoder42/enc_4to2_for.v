module enc_4to2_case (a, en, y);
    input  [3:0] a;
    input        en;
    output [1:0] y;
    reg    [1:0] y;
    reg    [3:0] temp;
    integer      n;

    always @(a, en) begin
        temp = 4'b0001;
        y = 2'bx;
        if (en == 1) begin
            for (n = 0; n<4; n = n+1) begin
                if(a == temp)
                    y = n;
                temp = temp << 1;
            end
        end
        else if(en == 0) begin
            y = 0;
        end
    end
endmodule