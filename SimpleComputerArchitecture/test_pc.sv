module test_pc;
logic clk, reset;
reg [7:0] count;
pc sys(clk, reset,count);
initial begin // Initialize clock
   clk = 0;
   forever #10 clk = ~clk;
end
initial begin // Testing using reset and watching count
reset = 0;
count = 0;
#150;
reset = 1;
#30;
reset = 0;
#180;
reset = 1;
#70;
reset = 0;
#200;
$stop;
end
initial begin //response monitor
$monitor("count = %d reset = %d",
	 count, reset);
end
endmodule
