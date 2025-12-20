`timescale 1ns/10ps
module tb_fbosc;
    reg clk, rst;

    fbosc_blk U0(y1_blk, y2_blk, clk, rst);
    fbosc_nonblk U1(y1_nonblk, y2_nonblk, clk, rst);

    initial begin
        clk = 0;
        forever
            #10 clk = ~clk;
    end

    initial begin
        rst = 0;
        #15 rst = 1;
        #25 rst = 0;
    end
endmodule