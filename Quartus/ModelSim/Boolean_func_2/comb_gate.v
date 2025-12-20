module comb_gate(a, b, c, d, e, f);
    input  a, b, c, d, e;
    output f;

    assign f = ~(a & b | c | d & e);

endmodule