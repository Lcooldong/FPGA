module dec_2to4_case(a, y);
    input  [1:0] a;
    output [3:0] y;
    reg    [3:0] y;

    always @(a) begin
        case(a)
            0 : y = 4'b0001;
            1 : y = 4'b0010;
            2 : y = 4'b0100;
            3 : y = 4'b1000;
            default : y = 4'bx;
        endcase
    end
endmodule