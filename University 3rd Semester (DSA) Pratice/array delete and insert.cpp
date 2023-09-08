#include<bits/stdc++.h>
using namespace std;
int inserting(int b[],int siz,int pos,int in)
{
  int i;
  for (i=siz-1;i>=pos;i--)
    b[i+1]=b[i];
    b[pos]=in;
    siz=siz+1;
    return siz;
}
void delet(int b[],int num,int index)
{
    int i;
    for(i=index;i<=num-1;i++)
    {
        b[i]=b[i+1];
    }
    num=num-1;
    for(i=0;i<num;i++)
    {
        cout<<b[i]<<" ";
    }
}
int main ()
{
    int a[]={1,2,3,4,6};
    int in=5;
    int pos=4;
    int sizee=sizeof(a)/sizeof(a[0]);
    int num=inserting(a,sizee,pos,in);
    for(int i=0;i<num;i++)
    {
        cout<<a[i]<<" ";
    }
    cout<<endl;
    int b[]={1,2,3,4,5,6};
    int si=sizeof(b)/sizeof(b[0]);
    int ind = 5;
    delet(a,si,ind);
}

