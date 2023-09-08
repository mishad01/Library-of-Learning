#include<bits/stdc++.h>
using namespace std;
void insertion(int b[],int num,int index,int in)
{
    int i;
    for (i=num-1;i<=index;i++)
    {
        b[i+1]=b[i];
    }
        b[index]=in;
        num=num+1;
        for (i=0;i<num;i++)
        {
            cout<<" "<<b[i];
        }

}
int main ()
{
    int a[]={1,2,3,5,6};
    int numofarraysize =sizeof(a)/sizeof(a[0]);
    int ind = 3;
    int input =4;
    insertion(a,numofarraysize,ind,input);
}
