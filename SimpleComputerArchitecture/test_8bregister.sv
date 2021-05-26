`timescale 1ns/1ps
module test_reg;
 reg [3:0] RA1,RA2,WA;
 reg signed[7:0] data_in;
 wire signed[7:0] data_out1, data_out2;
 logic clk, write_enable;
 reg_file sys(RA1, RA2, WA, data_in, clk, write_enable, data_out1, data_out2);
 int count = 0;
initial begin
   clk = 0;
   forever #10 clk = ~clk;
end
initial begin
   RA1 = 0;
   RA2 = 0;
   WA = 0;
   data_in = 0;
   write_enable = 1;
   #10 
   for(int i = 0; i < 4; i++)
	begin
	if(i==1|i==3)
	   write_enable = 1;
	else
	   write_enable = 0;
	for(int j = 0; j < 4; j++)
	   begin
	     RA1 = count;
	     RA2 = count-2;
	     WA = count;
	     data_in = count-6;
	     count++;
	     #20;
	   end
	end
$stop;
end
initial begin //response monitor
$monitor("WA = %d data input = %d write enable = %d  ||  Address %d:%d  ||  Address %d:%d",
	 WA, data_in, write_enable, RA1, data_out1, RA2, data_out2);
end
endmodule