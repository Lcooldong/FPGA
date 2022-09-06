module fbosc_blk(y1, y2, clk, rst);
    output y1, y2;
    input  clk, rst;
    reg    y1, y2;

    always @(posedge clk or posedge rst) begin
        if(rst) y1 = 0;     // reset
        else    y1 = y2;
    end

    always @(posedge clk or posedge rst) begin
        if(rst) y2 = 1;     // set
        else    y2 = y1;
    end
endmodule