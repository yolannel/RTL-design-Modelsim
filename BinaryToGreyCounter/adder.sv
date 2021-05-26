module adder(
	input logic [3:0] a,
	input logic clk,
	input logic reset,
	output logic[3:0] b,
	output logic c_out);

logic[3:0] s;
logic temp_c;

always_comb {c_out, s} <= b + a;
always_ff @ (posedge clk)
begin
if (reset) b <= 4'b0;
else
	begin
	 b <= s;
	end
end

endmodule