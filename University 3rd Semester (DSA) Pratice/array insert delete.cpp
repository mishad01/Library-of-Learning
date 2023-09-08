#include<bits/stdc++.h>
using namespace std;
int inserting(int b[],int n,int pos,int item)
{
    int i;
    for (i=n-1;i>=pos;i--)
    {
        b[i+1]=b[i];
    }
    b[pos]=item;
    n=n+1;
    return n;
}
int delet(int c[],int n,int pos)
{
    int i;
    for(i=pos-1;i<=n;i++)
    {
        c[i]=c[i+1];
    }
    return n=n-1;

}
int main()
{
    //int a[]={1,2,3,5,6};
   // int num = sizeof(a)/sizeof(a[0]);
   // int po=3;
    //int it=4;
    /*inserting(a,num,po,it);
    for(int i=0;i<=num;i++)
    {
        cout<<a[i];
    }*/
    int b[]={1,2,3,4,5,6,7};
    int no= sizeof(b)/sizeof(b[0]);
    int f = delet(b,no,2);
    for(int i=0;i<f;i++)
    {
        cout<<b[i]<<" ";
    }
}
