`timescale 1ns/10ps
module tb_comp;
    reg [3:0] a, b;
    wire      agtb, altb, aeqb;

    // comp_assign U0 (a, b, agtb, altb, aeqb); 
    // comp_if U0 (a, b, agtb, altb, aeqb);
    comp_for U0 (a, b, agtb, altb, aeqb);

    always begin
            a = 4'b0001; b = 4'b1001;
        #10 a = 4'b0010; b = 4'b0000;
        #10 a = 4'b1100; b = 4'b1101;
        #10 a = 4'b1001; b = 4'b1001;
        #10 a = 4'b0111; b = 4'b0100;
        #10 a = 4'b1111; b = 4'b1111;
        #10 a = 4'b1101; b = 4'b1001;
        #10 a = 4'b0000; b = 4'b0000;
        #10 a = 4'b1010; b = 4'b1010;
        #10 a = 4'b0001; b = 4'b1011;
        #10;
    end
endmodule