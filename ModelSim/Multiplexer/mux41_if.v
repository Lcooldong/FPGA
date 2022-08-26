module mux41_if (sel, a, b, c, d, y);
    input  [1:0] sel;
    input  [3:0] a, b, c, d;
    output [3:0] y;
    reg    [3:0] y;

    always @(sel or a or b or c or d) begin // always @(sel, a, b, c, d)
        if      (sel == 2'b00) begin
            y = a;
        end
        else if (sel == 2'b01) begin
            y = b;
        end
        else if (sel == 2'b10) begin
            y = c;
        end
        else if (sel == 2'b11) begin
            y = d;
        end
        else begin
            y = 4'bx;
        end
    end
endmodule