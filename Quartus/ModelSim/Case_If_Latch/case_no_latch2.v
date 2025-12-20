// test bench 없음
module case_no_latch1(memce0, memce1, cs, en, addr);
    output        memce0, memce1, cs;
    input         en;
    input [31:30] addr;
    reg           memce0, memce1, cs;

    always @(addr, en) begin
        {memce0, memce1, cs} = 3'b0;    // 초기값 할당
        casez ({addr, en})
            3'b101: memce0 = 1'b1;
            3'b111: memce1 = 1'b1;
            3'b0?1: cs = 1'b1;
        endcase
    end
endmodule