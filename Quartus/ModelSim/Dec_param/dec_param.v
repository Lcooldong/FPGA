module dec_param(en, a, y);
    parameter in_width = 3, out_width = 8;
    input                  en;
    input  [in_width-1:0]  a;
    output [out_width-1:0] y;
    reg    [out_width-1:0] y;
    integer                n;

    always @(en, a) begin
        if(!en)
            y =0;
        else
            if(a > out_width-1)
                for (n = 0; n <= out_width-1; n = n+1) begin
                    y[n] = 1'bx;
                end
            else
                for (n = 0; n <= out_width-1; n = n+1) begin
                    if(a == n)
                        y[n] = 1'b1;
                    else
                        y[n] = 1'b0;
                end
    end
endmodule