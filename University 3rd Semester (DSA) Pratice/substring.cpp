#include<bits/stdc++.h>
using namespace std;
void substring(char *txt,int pos,int len)
{
    int i,j=0;
    char sub[50];
    for (i=pos;i<pos+len;i++)
    {
        sub[j]=txt[i];
        j++;
    }
    sub[len]='\0';
    cout<<sub;
}
void insert(char *name,int pos,char *sub)
{

    substring(name,0,pos);
    cout<<sub;
    substring(name,pos,strlen(name)-pos);
    }
void delet(char *txt,int pos,int len)
{
    substring(txt,0,pos);
    substring(txt,pos+len,strlen(txt)-pos-len);
}
int main ()
{
    int n=100;
    char a[100] ="Brotherandyoumishad";
    //substring(a,3,7);
    cout<<endl;
    char add[50]="of bangladesh";
    //insert(a,11,add);
    cout<<endl;
    delet(a,8,7);

    return 0;
}
