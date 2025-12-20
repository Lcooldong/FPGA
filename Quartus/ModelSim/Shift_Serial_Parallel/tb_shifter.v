`timescale 1ns/10ps
module tb_shifter;
    parameter Len = 8;
    reg clk, rst, en, wr, rd, si;
    wire [Len-1:0] data_io;

    shifter U0(clk, rst, en, wr, rd, si, so, data_io);

    initial begin
        clk = 0;
        forever begin
            #20 clk = ~clk;
        end
    end

    initial begin
        rst = 0;        // shift_reg = 8'b0000_0000
        #10 rst = 1;    // en 하면 시작
    end

    initial begin
        rd = 1;     // data_io 8'bz 유지
        wr = 1;
        en = 1;

        #20 en = 0; // shift start
        #10 si = 0;
        #10 si = 1;
        #10 si = 1;
        #10 si = 0;
        #30 en = 1; rd = 0;
        #15 wr = 0;
        #10 rd = 1; wr = 1;
    end
endmodule