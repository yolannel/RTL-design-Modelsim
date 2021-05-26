module reg_file(input logic [3:0] RA1, RA2, WA,
 input logic signed[7:0] data_in,
 input logic clk, write_enable,
 output logic signed[7:0] data_out1, data_out2);
logic signed[7:0] rf [0:15];
assign data_out1 = rf[RA1]; // asynchronous read
assign data_out2 = rf[RA2]; // asynchronous read
always @ (posedge clk) // synchronous write
  if (write_enable)
     rf[WA] <= data_in;
endmodule 