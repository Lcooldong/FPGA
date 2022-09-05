module comp_for(a, b, agtb, altb, aeqb);
    parameter    size = 4;
    input  [size-1:0] a, b;
    output       altb, agtb, aeqb;
    reg          altb, agtb, aeqb;
    integer i;

    always @(a or b)begin : Loop_Comp
        altb = 1'b0;
        agtb = 1'b0;
        aeqb = 1'b1;

        for (i = size-1; i>=0; i=i-1) begin
            if(a[i] != b[i]) begin
                agtb = a[i];
                altb = ~a[i];
                aeqb = 0;
                disable Loop_Comp;
            end
        end
    end
endmodule