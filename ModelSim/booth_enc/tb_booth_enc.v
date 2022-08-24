`timescale  1ns/10ps
module tb_booth_enc;
    reg [2:0] xin;
    wire      y, y2, neg;
    integer   i;

    booth_enc U0(xin, y, y2, neg);
    
    initial begin
        xin = 0;    
        for (i = 1; i < 16; i=i+1)
            #20 xin = i;
    end
endmodule