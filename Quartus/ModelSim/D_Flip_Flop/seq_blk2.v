module seq_blk2(clk, a, b, c, d, e, y);
    input  clk, a, b, c, d, e;
    output y;
    reg    y;

    always @(posedge clk) begin
       y = ~(m | n | e);
       m = ~(a & b);
       n = c | d;
    end
endmodule