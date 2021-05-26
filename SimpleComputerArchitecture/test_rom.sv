module test_rom;
logic [7:0] address;
logic [23:0] data_out;
rom sys(address,data_out);
reg [3:0] RA1,RA2,WA,op;
reg signed[7:0] external_data_in, ALUresult;
reg [1:0] ALUcontrol;
logic clk,regwrite,ALUsrc;
cu ctrl(op, regwrite, ALUsrc,ALUcontrol); // Since ROM holds assembly, control unit was created as a intermediate unit to read instructions
reg_file_alu regAlu(RA1,RA2,WA,external_data_in,ALUcontrol,clk,regwrite,ALUsrc,ALUresult); // Used to test instructions from ROM

initial begin // Initiate clock
   clk = 0;
   forever #10 clk = ~clk;
end
initial begin // Preset values
   external_data_in = 0;
   WA = 0;
   RA1 = 1; RA2 = 1;
   op = 4'b0000;
   #10;
for(int i = 0; i<4; i++) // Set to 4 loops since 4 sets of instructions
   begin
	#10;
	address = i;
	assign op = data_out[23:20]; // further goes to control unit to be split into ALU instructions
	assign WA = data_out[19:16];
	assign RA1 = data_out[15:12];
	assign RA2 = data_out[11:8];
	assign external_data_in = data_out[7:0];
	#20;
   end
   $stop;
 end
initial begin //response monitor
$monitor("dataout = %b || WA = %d RA = %d,%d write enable = %d  ||  External data = %d ALU source = %d || Select = %b Output = %d",
	 data_out,WA, RA1, RA2 , regwrite, external_data_in, ALUsrc, ALUcontrol, ALUresult);
end
endmodule