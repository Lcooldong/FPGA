`timescale 1ns/10ps
module tb_shift_reg_nblk;
    reg clk, rst, sin;    
    wire sout;

    shift_reg_nblk U0(clk, rst, sin, sout);

    initial begin
        clk = 0;
        forever
            #20 clk = ~clk;      
    end

    initial begin
        rst = 0;
        #40 rst = 1;
    end

    initial begin
        sin = 0; 
        #10 sin = 1; 
        #15 sin = 0; 
        #10 sin = 0;
        #20 sin = 1;
        #10 sin = 0;
    end
endmodule
