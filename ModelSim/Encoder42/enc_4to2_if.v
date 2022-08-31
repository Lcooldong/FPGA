module enc_4to2_if(a, y);
    input  [3:0] a;
    output [1:0] y;
    reg    [1:0] y;

    always @(a) begin
        if     (a == 4'b0001) y = 0;
        else if(a == 4'b0010) y = 1;
        else if(a == 4'b0100) y = 2;
        else if(a == 4'b1000) y = 3;
        else                  y = 2'bx;
    end
endmodule