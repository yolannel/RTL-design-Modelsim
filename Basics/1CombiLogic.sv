module combilog(input logic A,B,C,
 output logic F);

  logic y1;
  logic y2;
  or  (F,y1,y2);
  and  (y1,A,B);
  and  (y2,!B,C);

endmodule