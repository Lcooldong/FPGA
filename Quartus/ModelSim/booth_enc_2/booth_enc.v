module booth_enc (xin, y, y2, neg, add);
    input [2:0] xin;
    output      y, y2, neg, add;
    reg   [3:0] tmp;

    assign   y = tmp[3];
    assign  y2 = tmp[2];
    assign neg = tmp[1];
    assign add = tmp[0]; 

    always @(xin) begin
        case (xin)
            0   : tmp = 4'b0101;
            1,2 : tmp = 4'b1000;
            3   : tmp = 4'b1100;
            4   : tmp = 4'b1111;
            5,6 : tmp = 4'b1011;
            7   : tmp = 4'b0111;
        endcase
    end
endmodule