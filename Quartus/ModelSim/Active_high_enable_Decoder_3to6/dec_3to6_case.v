module dec_3to6_case(en, a, y);
    input        en;
    input  [2:0] a;
    output [5:0] y;
    reg    [5:0] y;
    reg    [3:0] temp;

    always @(en, a) begin
        temp = {en, a};
        if (temp[3] == 1) begin
            case(temp)
                4'b1000 : y = 6'b000001;
                4'b1001 : y = 6'b000010;
                4'b1010 : y = 6'b000100;
                4'b1011 : y = 6'b001000;
                4'b1100 : y = 6'b010000;
                4'b1101 : y = 6'b100000;
                4'b1110 : y = 6'b000000;
                4'b1111 : y = 6'b000000;
            endcase
        end
        else
            y = 6'b000000;
    end
endmodule