module instruction_memory(input logic clk,reset,
	output logic [23:0] instr);
reg[7:0] pcaddress; // intermediate holder
pc sys(clk, reset,pcaddress); // counting output assigned to intermediary
rom out(pcaddress,instr); // runs program at address equal to count
endmodule