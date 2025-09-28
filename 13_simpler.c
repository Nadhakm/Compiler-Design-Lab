#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX 20
#define N 10

typedef struct{
        char op;
        char a[MAX];
        char b[MAX];
        char res[MAX];
}quad;
quad q[N];
int n;

int isnum(char *s)
{
        for(int i=0;s[i];i++){
                if(!isdigit(s[i])) return 0;}
        return 1;
}
int eval(int x,int y,char op)
{
        if (op=='+') return x+y;
         if (op=='-') return x-y;
         if (op=='*') return x*y;
        return 0;
}
int main()
{
        printf("Enter the number of 3-address instructions: ");
        scanf("%d",&n);
        for(int i=0;i<n;i++)
	{
                scanf(" %c %s %s %s",&q[i].op,q[i].a,q[i].b,q[i].res);
        }
        for(int i=0;i<n;i++)
	{
                if(isnum(q[i].a)&& isnum(q[i].b))
		{
                        int r=eval(atoi(q[i].a), atoi(q[i].b), q[i].op);
                        q[i].op='=';
                        sprintf(q[i].a,"%d",r);
                        strcpy(q[i].b,"");
                }
        }
        for(int i=0;i<n;i++)
	{
                for (int j=0;j<n;j++)
		{
                        if(q[j].op=='=' && isnum(q[j].a))
			{
                                if(!strcmp(q[i].a,q[j].res)) strcpy(q[i].a,q[j].a);
                                if(!strcmp(q[i].b,q[j].res)) strcpy(q[i].b,q[j].a);
                        }
                }
        }
    printf("The code after constant folding and propogation is:\n");
    printf("op\topnd1\topnd2\tresult\n");
    printf("==============================\n");
    for(int i=0;i<n;i++)
    {
        printf("%c\t%s\t%s\t%s\n",q[i].op,q[i].a,q[i].b,q[i].res);
    }
}
