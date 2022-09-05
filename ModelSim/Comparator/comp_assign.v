module comp_assign(a, b, agtb, altb, aeqb);
    input  [3:0] a, b;
    output       altb, agtb, aeqb;

    assign altb = (a < b);
    assign agtb = (a > b);
    assign aeqb = (a == b);
     
endmodule