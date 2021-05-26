`timescale 1ns/1ps
module test_ALU;

 reg signed[7:0] A,B;
 reg[1:0] ALU_Sel;
 wire signed[7:0] ALU_Out;
 alu sys(A,B,ALU_Out,ALU_Sel);
initial begin
   A = 3;
   B = 4;
   ALU_Sel = 0;
   #10;
   ALU_Sel = 2'b01;
   #10;
   ALU_Sel = 2'b10;
   #10;
   ALU_Sel = 2'b11;
   #30;
   A = 6;
   B = 4;
   ALU_Sel = 0;
   #10;
   ALU_Sel = 2'b01;
   #10;
   ALU_Sel = 2'b10;
   #10;
   ALU_Sel = 2'b11;
   #10;
   A = 8'b01111111;
   B = 8'b00011111;
   ALU_Sel = 0;
   #10;
   ALU_Sel = 2'b01;
   #10;
   ALU_Sel = 2'b10;
   #10;
   ALU_Sel = 2'b11;
end
initial begin //response monitor
$monitor("A = %d B = %d Select = %d Output = %d",
	 A, B, ALU_Sel, ALU_Out);
end
endmodule