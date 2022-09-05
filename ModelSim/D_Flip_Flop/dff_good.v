module dff_good(clk, d, q, q_bar);
    input  d, clk;
    output q, q_bar;
    reg    q;

    assign q_bar = ~q;

    always  @(posedge clk) begin
        q <= d;
    end
endmodule