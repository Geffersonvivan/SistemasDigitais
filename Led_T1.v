module Exe01(

	input clk,
	output s);


	assign s = clk;
	
endmodule
	
module teste;
	
	reg clk;
	always #3 clk <= ~clk;
	
	wire s;
	
	Exe01 e(clk, s);
	
	initial begin
	$dumpvars(0, e);
	#1
	clk = 1;
	#500;
	$finish;

	end
endmodule
