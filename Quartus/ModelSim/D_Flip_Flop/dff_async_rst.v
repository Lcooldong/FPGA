module dff_async_rst(clk, d, rst_n, q, qb);
    input  clk, d, rst_n;
    output q, qb;
    reg    q;

    assign qb = ~q;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            q <= 1'b0;
        else
            q <= d;
    end


endmodule