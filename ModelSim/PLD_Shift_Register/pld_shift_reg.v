module pld_shift_reg(clk, rst, load, din, pout);
    input       clk, rst, load;
    input  [7:0] din;
    output [7:0] pout;
    reg    [7:0] data_reg;

    assign pout = data_reg;

    always @(posedge clk) begin
        if(!rst) data_reg <= 0;
        else   
          if(load) data_reg <= din;
          else     data_reg <= data_reg << 1;
    end
endmodule