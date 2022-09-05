module tristate_gate(in, oe, out);
    input  in, oe;
    output out;

    bufif1 b1(out, in, oe); // active-high oe

endmodule