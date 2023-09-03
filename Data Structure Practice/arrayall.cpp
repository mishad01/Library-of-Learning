#include<bits/stdc++.h>
using namespace std;
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
    int b[]={1,2,45,53,58,63,69,72};
    int n=sizeof(b)/sizeof(b[0]);
    cout<<binary(b,0,n,72);

}
