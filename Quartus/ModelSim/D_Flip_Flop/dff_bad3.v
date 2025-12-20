module dff_bad3(clk, d, q, q_bar);
    input  d, clk;
    output q, q_bar;
    reg    q, q_bar;

    always @(posedge clk) begin
        q     <= d;
        q_bar <= ~q;
    end
endmodule

  