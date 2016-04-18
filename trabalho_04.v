module calculo(input [9:0] p1x, input [9:0] p1y, input [9:0] p2x, input [9:0] p2y, input [9:0] p3x, input [9:0] p3y, output saida);

  wire signed [24:0] m1;
  wire signed [24:0] m2;

  assign m1 = (p1x - p3x) * (p2y - p3y);
  assign m2 = (p2x - p3x) * (p1y - p3y);
  
  assign saida = m1 < m2;

endmodule

module triangulo(input [9:0] ptx, input [9:0] pty, input [9:0] p1x, input [9:0] p1y, 
				 input [9:0] p2x, input [9:0] p2y, input [9:0] p3x, input [9:0] p3y, output resultado);


wire s1, s2, s3; 

calculo S1(ptx, pty, p1x, p1y, p2x, p2y, s1);
calculo S2(ptx, pty, p2x, p2y, p3x, p3y, s2);
calculo S3(ptx, pty, p3x, p3y, p1x, p1y, s3);


assign resultado = s1 == s2 & s2 == s3;

endmodule

module teste;
	
	integer escrever;
	
	reg [9:0]x1;
	reg [9:0]x2;
	reg [9:0]x3;
	reg [9:0]y1;
	reg [9:0]y2;
	reg [9:0]y3;
	reg [9:0]px;
	reg [9:0]py;
	reg clk;
	reg reset;
	
	triangle A(px,py,x1,y1,x2,y2,x3,y3,saida);
	
	initial begin
		escrever = $fopen("resultado.txt", "w");
		$dumpvars(0, A);
		#0;
			x1 <=0;
			y1 <=0;
			x2 <=10;
			y2 <=0;
			x3 <=0;
			y3 <=10;
			px <=3;
			py <=3;
		#5;
			$fdisplay(escrever, "%d", saida);
		#6;
			x1 <=15;
			y1 <=15;
			x2 <=30;
			y2 <=0;
			x3 <=15;
			y3 <=0;
			px <=3;
			py <=3;
		#9;
			$fdisplay(escrever, "%d", saida);
		$finish;
	end

endmodule
