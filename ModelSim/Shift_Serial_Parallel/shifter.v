module shifter(clk, rst, en, wr, rd, si, so, data_io);
    parameter       Len = 8;
    input           clk, rst, en, wr, rd, si;
    output          so;
    inout [Len-1:0] data_io;
    reg   [Len-1:0] shift_reg;

    assign data_io = !rd ? shift_reg : {Len{1'bz}};
    assign so = shift_reg[7];

    always @(posedge clk) begin
        if(!rst)
            shift_reg <= {Len{1'b0}};
        else begin
            if(!en) begin
                shift_reg <= shift_reg << 1;
                shift_reg[0] <= si;
            end
            else if(!wr)
                shift_reg <= data_io;
        end
    end
endmodule