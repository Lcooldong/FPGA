`timescale 1ns/10ps
module tb_comb_gate;
    reg a, b, c, d, e;
    wire f;
    integer i;

    comb_gate U0(a, b, c, d, e, f);

    initial begin
        a = 0; b = 0; c = 0; d = 0; e = 0;
        for (i = 1; i < 32; i = i+1) begin
            #10 a = i/16;  
                b = (i%16)/8;
                c = (i%8)/4;
                d = (i%4)/2;
                e = i%2;
        end
        #10;    
    end
endmodule