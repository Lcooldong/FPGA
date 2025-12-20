module mux81_case (sel, in_word, out_bit);
    input  [2:0] sel;
    input  [7:0] in_word;
    output       out_bit;
    reg          out_bit;

    always @(sel, in_word) begin
        case (sel)
            0 : out_bit = in_word[0];
            1 : out_bit = in_word[1];
            2 : out_bit = in_word[2]; 
            3 : out_bit = in_word[3];
            4 : out_bit = in_word[4];
            5 : out_bit = in_word[5];
            6 : out_bit = in_word[6];
            7 : out_bit = in_word[7];
            default : out_bit = 1'bx;
        endcase
    end
endmodule