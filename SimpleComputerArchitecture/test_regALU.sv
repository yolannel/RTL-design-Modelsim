module test_regALU;
reg [3:0] RA1,RA2,WA,temp1,temp2;
reg signed[7:0] external_data_in, ALUresult;
reg [1:0] ALUcontrol;
logic clk,regwrite,ALUsrc;
reg_file_alu sys(RA1,RA2,WA,external_data_in,ALUcontrol,
	clk,regwrite,ALUsrc,ALUresult);
initial begin // Start the clock
   clk = 0;
   forever #10 clk = ~clk;
end
initial begin
   // Preset values, set first output to 0
   regwrite = 1;
   external_data_in = 0;
   WA = 0;
   RA1 = 1; RA2 = 1;
   assign temp1 = RA1-1;
   assign temp2 = RA2-1;
   ALUsrc = 1;
   ALUcontrol = 2'b00; // and function
   #10;
   // Run from 1 to 11 and assign them to the same address
   for(int i = 1; i<16; i++)
	begin
	ALUcontrol = 2'b01; // or function
	external_data_in = i; RA2 = i;
	WA = i;
	if(i>12) // Assign last 4 addresses to 4 ALU operations
	   begin
	   RA1 = 6; RA2 = i-4;
	   ALUsrc = 0; ALUcontrol = i-12;
	   end
	#20;
	end
   #20;
end
initial begin //response monitor
$monitor("WA = %d RA = %d,%d write enable = %d  ||  External data = %d ALU source = %d || Select = %b Output = %d",
	WA, temp1,temp2 , regwrite, external_data_in, ALUsrc, 
	ALUcontrol, ALUresult);
end
endmodule