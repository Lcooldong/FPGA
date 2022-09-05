module blk1(clk, d, q3);
    input  clk;
    output q3;
    input  d;
    reg    q3, q2, q1, q0;

    always @(posedge clk) begin
        q0 = d;
        q1 = q0;
        q2 = q1;
        q3 = q2;
    end
endmodule