#include<stdlib.h>
#include<stdio.h>

typedef struct{
	int x,y;
}Triangulo;

int confereponto(Triangulo ponto1,Triangulo ponto2,Triangulo ponto3){
	int valor;
	valor = (ponto1.x*(ponto2.y-ponto3.y) + ponto2.x*(ponto3.y-ponto1.y)+ ponto3.x*(ponto1.y-ponto2.y));
	return valor;
}

int main(){
    Triangulo t1,t2,t3,p;

    int count,valor,valor1,valor2,valor3;

    FILE *LeituraT;
    FILE *LeituraP;
    FILE *Salva;


    LeituraT=fopen("Triangulos.txt","r");
    LeituraP=fopen("Pontos.txt","r");

    Salva=fopen("Resultados.txt","w");
    
    for(count=0; count<2; count++){
        fscanf(LeituraT,"%i %i",&t1.x,&t1.y);
        fscanf(LeituraT,"%i %i",&t2.x,&t2.y);
        fscanf(LeituraT,"%i %i",&t3.x,&t3.y);
        fscanf(LeituraP,"%i %i",&p.x,&p.y);
        
        valor = confereponto(t1,t2,t3);
        valor1 = confereponto(p,t2,t3);
        valor2 = confereponto(t1,p,t3);
        valor3 = confereponto(t1,t2,p);
        
        if(valor==valor1+valor2+valor3){
                printf("A coordenada esta dentro do triangulo\n");
                fprintf(Salva,"1\n");
        }else{
                printf("A coordenada esta fora do triangulo\n");
                fprintf(Salva,"0\n");
        }
    }
    return(0);
}
