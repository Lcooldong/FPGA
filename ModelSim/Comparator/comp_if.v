module comp_if(a, b, agtb, altb, aeqb);
    input  [3:0] a, b;
    output       altb, agtb, aeqb;
    reg          altb, agtb, aeqb;

    always @(a or b) begin
        altb = 1'b0;
        agtb = 1'b0;
        aeqb = 1'b0;
        if     (a == b) aeqb = 1'b1;
        else if(a > b)  altb = 1'b1;
        else            agtb = 1'b1;
    end
endmodule