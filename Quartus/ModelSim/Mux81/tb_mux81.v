`timescale 1ns/10ps
module tb_mux81;
    reg [2:0] sel;
    reg [7:0] in_word;
    wire      out_bit;
    integer  i;

    mux81_case U0 (sel, in_word, out_bit);

    initial begin
        in_word = 8'b0000_0000;
        sel = 3'b000;

        for ( i = 0; i<16; i=i+1) begin  
            in_word = 8'b0000_0001 << (i%8);
            sel = i;
            #10;
        end
        #10;
    end 
endmodule



