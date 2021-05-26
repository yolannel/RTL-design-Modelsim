module reg_file_alu(
	input logic [3:0]RA1,RA2,WA,
	input logic signed[7:0]external_data_in,
	input logic [1:0]ALUcontrol,
	input logic clk,regwrite,ALUsrc,
	output logic signed[7:0] ALUresult
	);
reg signed[7:0] RD1, RD2; 
	// outputs of the register file accessed from RA1 and RA2
reg signed[7:0] mux_out; 
	// intermediary to choose either external data or RD2
reg_file step1(RA1, RA2, WA, ALUresult, clk, regwrite, RD1, RD2);
assign mux_out = (ALUsrc) ? external_data_in : RD2; 
	// if ALUsrc = 0, use RD2, otherwise use external data
alu step2(RD1,mux_out,ALUresult,ALUcontrol);
endmodule