#include<bits/stdc++.h>
using namespace std;
int liner(int b[],int n,int s)
{
   int i;
   for(i=0;i<n;i++)
   {
   	if(b[i]==s)
   	{
   		return i;
   	}
   }
}
int bubble(int b[],int n)
{
    int i,j,temp;
    for (i=0; i<n; i++)
    {
        for(j=0; j<n-1; j++)
        {
            if(b[j]>b[j+1])
            {
                temp=b[j];
                b[j]=b[j+1];
                b[j+1]=temp;
            }
        }
    }
for (int i=0; i<n; i++)
    {
        cout<<b[i]<<" ";
    }
}
int binary(int a[],int lb,int ub,int item)
{
    if(lb>ub)
    {
        return -1;
    }
    int mid;
    mid=(lb+ub)/2;
    if(a[mid]==item)
    {
        return mid;
    }
    if(a[mid]>item)
    {
        ub=mid-1;
        return binary(a, lb, ub, item);
    }
    if(a[mid]<item)
    {
        lb=mid+1;
        return binary(a,lb,ub,item);
    }
}


int main ()
{
    int a[]= {38,756,34,12,64,22,87,8,13};
    int len=sizeof(a)/sizeof(a[0]);
    //cout<<liner(a,len,12 );
    //bubble(a,len);
    int b[]={1,2,45,53,58,63,69,72};
    int n=sizeof(b)/sizeof(b[0]);
    cout<<binary(b,0,n,72);


}
