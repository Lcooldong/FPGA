module dff(clk, d, q);
    input  d, clk;
    output q;
    reg    q;

    always @(posedge clk) begin
            q <= d;
    end
endmodule