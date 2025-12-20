module mux41_conop(sel, a, b, c, d, y);
    input  [1:0] sel;
    input  [3:0] a, b, c, d;
    output [3:0] y;

    assign y = (sel == 0) ? a:
               (sel == 1) ? b:
               (sel == 2) ? c:
               (sel == 3) ? d: 4'bx;
endmodule