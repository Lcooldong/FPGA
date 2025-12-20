module dff_bad1(clk, d, q, q_bar);
    input  d, clk;
    output q, q_bar;
    reg    q, q_bar;

    always @(posedge clk) begin     // nonblocking
        q     <= d;
        q_bar <= ~d;
    end
endmodule

