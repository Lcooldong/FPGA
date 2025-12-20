module shift_reg_nblk(clk, rst, sin, sout);
    input        clk, rst, sin;
    output       sout;
    reg    [7:0] q;

    assign sout = q[7];

    always @(posedge clk) begin
        if(!rst)
            q <= 0;
        else begin
            q[0]   <= sin;
            q[7:1] <= q[6:0];
        end
    end
endmodule