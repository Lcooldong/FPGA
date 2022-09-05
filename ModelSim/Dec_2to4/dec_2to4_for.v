module dec_2to4_for(a, y);
    input  [1:0] a;
    output [3:0] y;
    reg    [3:0] y;
    integer      n;

    always @(a) begin
        for (n = 0; n <=3;  n = n+1 ) begin
            if(a == n)
                y[n] = 1'b1;
            else
                y[n] = 1'b0;
        end
    end
endmodule