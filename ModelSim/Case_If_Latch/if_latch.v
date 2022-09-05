module if_latch(a, b, y_out);
    input        a, b;
    output [3:0] y_out;
    reg    [3:0] y_out;

    always @(a, b) begin
        if     (({a, b}) == 2'b11) y_out = 5;
        else if(({a, b}) == 2'b10) y_out = 2;
        else if(({a, b}) == 2'b01) y_out = 3;
    end
endmodule