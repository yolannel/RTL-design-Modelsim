module alu(input logic signed[7:0] a,
 input logic signed[7:0] b,
 output logic signed[7:0] ALUResult,
 input logic [1:0] ALUControl);
always_comb
begin
 case(ALUControl)
 2'b00 : ALUResult = a & b; // bitwise a AND b
 2'b01 : ALUResult = a | b; // bitwise a OR b
 2'b10 : ALUResult = a + b; // addition a + b
 2'b11 : ALUResult = a - b; // subtraction a - b
 default : ALUResult = 8'b0;
 endcase
end
endmodule