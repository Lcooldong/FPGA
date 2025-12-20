module dec_param_inst(en, addr, dec_addr);
    input        en;
    input  [2:0] addr;
    output [5:0] dec_addr;

    dec_param #(3, 6) decoder_3to6(en, addr, dec_addr);
endmodule