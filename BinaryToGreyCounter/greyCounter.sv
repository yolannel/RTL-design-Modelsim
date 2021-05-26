module greyCounter(
	input logic unsigned[3:0] a,
	input logic clk,
	input logic reset,
	output logic[3:0] g,
	output logic c_out);
logic [3:0] b;
adder sys1(a,clk,reset,b,c_out);
binToGrey sys2(b,g);

endmodule