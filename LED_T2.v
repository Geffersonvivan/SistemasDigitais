module valores( input CLOCK_50, output LEDG);

	reg [25:0] contador=0;
	reg led_reg=0;

	assign LEDG = led_reg;

	always @(posedge CLOCK_50) begin
		if(contador == 50000000) begin
			led_reg = ~led_reg;
			contador = 0;
		end else begin
			contador <= contador+1;
		end
	end
endmodule
   
module test;

	reg clk;
	wire led;

	valores A(clk,led);

	always #1 clk = ~clk;
	
	initial begin
		$dumpvars(0,A);
		#0;
		clk <= 0;
		#200000000;
		$finish;
	end
		
endmodule
