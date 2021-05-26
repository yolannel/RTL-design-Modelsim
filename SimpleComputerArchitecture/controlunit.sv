module cu(input logic[3:0] op,
	output logic regwrite, ALUsrc,
	output logic[1:0]ALUcontrol);
assign regwrite = !op[3];
assign ALUsrc = op[2];
assign ALUcontrol[1] = !op[1];
assign ALUcontrol[0] = op[0];
endmodule;