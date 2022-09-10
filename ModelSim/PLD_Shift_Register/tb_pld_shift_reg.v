`timescale 1ns/10ps
module tb_pld_shift_reg;
  reg  clk, rst, load;
  reg [7:0] din;
  wire [7:0] pout;
  
  pld_shift_reg U0 (clk, rst, load, din, pout);

  initial begin
    clk = 0;
    forever 
        #20 clk = ~clk;
  end

  initial begin
    load = 0;
    forever begin
        #30 load = 1;
        #40 load = 0;
        #50;
    end
  end

  initial begin
    rst = 0;    // active-low
    #10 din = 8'b0000_0000;

    #30 rst = 1;

    #5  din = 8'b0000_0001;
    #20 din = 8'b0000_1001;
    #20 din = 8'b0100_0001;

  end
endmodule