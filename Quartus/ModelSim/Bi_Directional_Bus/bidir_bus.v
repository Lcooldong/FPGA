module bidir_bus(send, send_data, rcv, received_data, bus_data);
    input   send, rcv;
    input   [7:0] send_data;
    inout   [7:0] bus_data;
    output  [7:0] received_data;

    assign received_data = (rcv) ? bus_data : 8'bz;
    assign bus_data = (send) ? send_data : bus_data;

endmodule