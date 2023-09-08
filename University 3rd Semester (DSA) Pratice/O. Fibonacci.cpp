#include<bits/stdc++.h>
using namespace std;
int main ()
{
    int fib[55];
    fib[1]={0};
    fib[2]={1};
    int n;
    cin>>n;
    for(int =0;i<55;i++)
    {
    fib[n]=fib(n-1)+fib(n-2);
    }
    cout<<fib[n];

}
