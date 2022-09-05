module dec_3to6_if(en, a, y);
    input  [2:0] a;
    input        en;
    output [5:0] y;
    reg    [5:0] y; 

    always @(en, a) begin
        if (en == 1) begin
            if      (a == 3'b000) y = 6'b000001;
            else if (a == 3'b001) y = 6'b000010;
            else if (a == 3'b010) y = 6'b000100;
            else if (a == 3'b011) y = 6'b001010;
            else if (a == 3'b100) y = 6'b010010;
            else if (a == 3'b101) y = 6'b100000;
            else if (a == 3'b110) y = 6'b000000;
            else if (a == 3'b111) y = 6'b000000;
        end
        else if (en == 0) begin
            y = 6'b000000;
        end
    end

endmodule