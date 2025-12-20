`timescale  1ns/10ps
`define PERIOD 20

module tb_tristate;
    reg in, oe;

    // tristate_gate U0_tristate_1(in, oe, out);
    tristate_conop U0_tristate_2(in, oe, out);

    initial begin
        #0              oe = 1'b0; in = 1'b1;
        #(`PERIOD)      in = 1'b0;
        #(`PERIOD)      in = 1'b1; oe = 1'b1;
        #(`PERIOD)      in = 1'b0;
        #(`PERIOD*2)    in = 1'b1;
        #(`PERIOD*3)    in = 1'b0;    
        #(`PERIOD)      in = 1'b0;
        #(`PERIOD*2)    in = 1'b1;
        #(`PERIOD)      in = 1'b1;
        #(`PERIOD*15)   $stop;

    end
endmodule