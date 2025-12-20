module latch_nonblk(en, a, b, c, y);
    input  en, a, b, c;
    output y;
    reg    m, y;

    always @(en, a, b, c) begin
        if(en) begin
            m <= ~(a | b);
            y <= ~(m & c);
        end
    end
endmodule