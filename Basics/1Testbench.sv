`timescale 1ns/1ps
module test_CombiLogic;

logic t_A,t_B,t_C,t_F;
combilog sys(t_A,t_B,t_C,t_F);
initial begin
t_A=0; t_B=0; t_C=0;
#10 t_A = 1;
#10 t_B = 1;
#10 t_C = 1;
#10 t_A = 0;
#10 t_B = 0;
#10 t_A = 1;
#10 t_A = 0; t_B = 1;t_C = 0;
end
initial begin //response monitor
$monitor("t_A = %d t_B = %d t_C = %d t_F = %d",
	 t_A, t_B, t_C, t_F);
end

endmodule