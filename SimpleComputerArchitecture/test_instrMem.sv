module test_instrMem;

logic clk,reset,regwrite,ALUsrc;
reg[23:0] instr;
reg [3:0] RA1,RA2,WA,op;
reg[7:0] address;
reg signed[7:0] external_data_in, ALUresult;
reg [1:0] ALUcontrol;

instruction_memory sys(clk,reset,instr);
cu ctrl(op, regwrite, ALUsrc,ALUcontrol);
reg_file_alu regAlu(RA1,RA2,WA,external_data_in,ALUcontrol,
	clk,regwrite,ALUsrc,ALUresult);

initial begin // Initialize clock
   clk = 0;
   forever #10 clk = ~clk;
end
initial begin // Preset values
   reset = 1;
   reset = 0;
   external_data_in = 0;
   WA = 0;
   RA1 = 1; RA2 = 1;
   op = 4'b0000;
   assign op = instr[23:20];
   assign WA = instr[19:16];
   assign RA1 = instr[15:12];
   assign RA2 = instr[11:8];
   assign external_data_in = instr[7:0];
   #20; // here-on testing reset function to re-run instructions
   reset = 1;
   #200;
   reset = 1;
   #50;
   reset = 0;
   #200;
   reset = 1;
   #10;
   reset = 0;
   #300;
   $stop;
end
initial begin //response monitor
$monitor("instr = %b || reset = %b || WA = %d RA = %d,%d write enable = %d  ||  External data = %d ALU source = %d || Select = %b Output = %d",
	instr, reset, WA, RA1, RA2 , regwrite, external_data_in, ALUsrc, 
	ALUcontrol, ALUresult);
end
endmodule;