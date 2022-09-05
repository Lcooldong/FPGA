// test bench 없음
module case_no_latch1(sel, in1, in2, y_out);
    input   [1:0] sel, in1, in2;
    output  [1:0] y_out;
    reg     [1:0] y_out;

    always @(sel, in1, in2) begin
        case (sel)
            2'b10 : y_out = in1;
            2'b01 : y_out = in2;
            default : y_out = 2'bx
        endcase
    end
endmodule