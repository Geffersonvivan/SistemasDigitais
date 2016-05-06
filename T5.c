#include <stdio.h>
#include <stdlib.h>

int main(){

	int x, inV, inC;
	FILE *LerC, *LerV, *Result;

	LerC = fopen("ResultC.txt", "r");
	LerV = fopen("ResultV.txt", "r"); 
	Result = fopen("Compara.txt", "x");

	x = 0;
	while(x<100){
		fscanf(LerC, "%d", &inC);
		fscanf(LerV, "%d", &inV);
		if (inC != inV)
		{
			fprintf(Result, "%d\n", x);
		}
		x++;
	}

	return 0;
}
