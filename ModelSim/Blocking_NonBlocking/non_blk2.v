module non_blk1(clk, d, q3);
    input  clk;
    output q3;
    input  d;
    reg    q3, q2, q1, q0;

    always @(posedge clk) begin
        q3 <= q2;
        q2 <= q1;
        q1 <= q0;
        q0 <= d;
    end

endmodule