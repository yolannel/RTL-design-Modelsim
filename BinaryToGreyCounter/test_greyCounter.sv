`timescale 1ns/1ps
module test_greyCounter;
logic clk, reset, c_out;
logic unsigned[3:0] a,g;
greyCounter sys(a,clk,reset,g,c_out);

initial begin // initialize clock
   clk = 0;
   forever #10 clk = ~clk;
end

initial begin // testing using reset and watching count
reset = 1;
a = 4'h1;
#20;
reset = 0;
#60;
a = 15;
#20;
$stop;
end

initial begin //response monitor
$monitor("a = %b || clk = %d || reset = %d || grey = %b || c_out = %b", a, clk, reset, g, c_out);
end
endmodule