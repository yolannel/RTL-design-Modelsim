module rom(input logic [7:0] address,
 output logic [23:0] data_out);
logic [23:0] data_ROM [0:255];

initial
$readmemh("rom.txt", data_ROM); // Read from text file in hex
assign data_out = data_ROM[address]; // Read contents at given index
endmodule