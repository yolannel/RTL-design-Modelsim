`timescale 1ns/1ps
module test_seqlog;
reg t_clk;
logic t_A,t_sel,t_F;
seqlog sys(t_A,t_sel,t_clk,t_F);

always #10 t_clk = ~t_clk;

initial begin
t_sel <= 1; t_A <= 1;
#80 t_A <= 5;
#150 t_sel <= 0;
#100 t_A <= 0;
#100 t_A <= 3;
end
initial begin //response monitor
$monitor("t_sel = %d t_A = %d t_F = %d",
	 t_sel, t_A, t_F);
end
endmodule