module dlatch(clock, d, q);
    input  clock, d;
    output q;
    reg    q;

    always @(clock or d) begin
        if(clock)
            q = d;
    end

endmodule