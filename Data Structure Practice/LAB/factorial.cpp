#include<iostream>
using namespace std;
int main ()
{
    int num;
    int fact=1;

    cout<<"Input a number"<<endl;
    cin>>num;

    for (int i=1;i<=num;i++)
    {
        fact = i * fact;
    }
    cout<<"Factorial of "<< num<< " is : "<<fact;
}

