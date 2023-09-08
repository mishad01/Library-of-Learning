#include<iostream>
#include<string.h>
#include<stdio.h>
using namespace std;

int main ()
{
    char text[20]="John cena";  //text
    char pat[20]="cena";       //pattern

    int x = strlen(text);
    int y = strlen(pat);

    int index;

    int i,j;
    for (i=0;i<=x-y;i++)
        for (j=0;j<y;j++)
    {
       if (text[i+j] != pat[j])
       {
           break;
       }

    }
    if (j==y)
       {
           index = i;
       }
    cout<<index;



}
