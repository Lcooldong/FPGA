// ative low positive level-sensitive
module dlatch_rst(rst, clock, d, q);
    input rst, clock, d;
    output q;
    reg    q;

    always @(rst or clock or d) begin
        if(!rst)
            q = 1'b0;
        else if(clock)
            q = d;
    end

endmodule