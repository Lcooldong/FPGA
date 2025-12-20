module case_latch(sel, in1, in2, y_out);
    input   [1:0] sel;
    input   [3:0] in1, in2;
    output  [3:0] y_out;
    reg     [3:0] y_out;

    always @(sel, in1, in2) begin
        case (sel)
            2'b10 : y_out = in1;
            2'b01 : y_out = in2;
        endcase
    end
endmodule