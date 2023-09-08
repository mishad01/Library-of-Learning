 #include<bits/stdc++.h>
using namespace std;
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
        cout<<" "<<b[i];
    }
}
int main()
{
    int a[]={1,2,3,4,5,6};
    int sizee=sizeof(a)/sizeof(a[0]);
    int ind = 5;
    delet(a,sizee,ind);
}
