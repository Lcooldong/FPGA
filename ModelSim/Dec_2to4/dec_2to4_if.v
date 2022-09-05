module dec_2to4_if(a, y);
    input  [1:0] a;
    output [3:0] y;
    reg    [3:0] y;

    always @(a) begin
        if      (a == 0) y = 4'b0001;
        else if (a == 1) y = 4'b0010;
        else if (a == 2) y = 4'b0100;
        else             y = 4'b1000;
    end
endmodule