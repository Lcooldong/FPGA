`timescale 1ns/10ps
`define PERIOD 20

module tb_bidir_bus;
    reg  send, rcv;
    reg  [7:0] send_data;
    wire [7:0] received_data, bus_data;

    bidir_bus U0(send, send_data, rcv, received_data, bus_data);
    
    initial begin
        #0           send = 1'b0; rcv = 1'b0; 
                     send_data = 8'h00;
        #(`PERIOD)   send_data = 8'h07;
        #(`PERIOD)   send_data = 8'h15; send = 1'b1;
        #(`PERIOD)   send_data = 8'hAB;
        #(`PERIOD)   send_data = 8'h34;
        #(`PERIOD)   send_data = 8'h11; send = 1'b0; rcv = 1'b1;
        #(`PERIOD*2) send_data = 8'h21;
        #(`PERIOD)   send_data = 8'h77;
        #(`PERIOD*2) send_data = 8'h66; send = 1'b1; rcv = 1'b1;
        #(`PERIOD)   send_data = 8'h12;
        #(`PERIOD)   send_data = 8'hCF; send = 1'b0; rcv = 1'b0;
        #(`PERIOD)   send_data = 8'h89;
        #(`PERIOD)   send_data = 8'h65;
        #(`PERIOD*15) $stop;
    end
endmodule
