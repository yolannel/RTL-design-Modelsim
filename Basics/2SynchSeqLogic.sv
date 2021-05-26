/*module seqlog(input logic A, select, clk,
 output reg F);

  reg D;

  always_ff @(posedge clk)
  begin
    assign D = (select) ? A : ~F;
    F <= D;
  end

endmodule*/
module model_2(output logic F,	       input logic A, select, CLK);always_ff@(posedge CLK)begin  if(select == 0) F <= ~F;  else F <= A;endendmodule

/*module seqlog(input logic A, select, clk,
 output logic F);

  logic D;
  reg Q;
  reg state, state_n;
  always_ff @(posedge clk)
  begin
    state <= state_n;
  end
  always_ff @(state,A,select)
  begin
    state_n = state;
    case(state)
	0:
	  if(!select || (A&select))
	    state_n = 1;
	  else
	    state_n = 0;
	1:
	  if(A&select)
	    state_n = 1;
	  else
	    state_n = 0;
    endcase
  end
  assign F = state;
endmodule*/