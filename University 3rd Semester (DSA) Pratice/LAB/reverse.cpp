#include<iostream>
using namespace std;
int main ()
{
    int arr[100];
    int i;
    cout<<"Input Number : "<<endl;

    for (i=0;i<5;i++)
    {
        cin>>arr[i];
    }
    cout<<"Reverse : ";
    for (i=5-1;i>=0;i--)

    {
       cout<<" "<<arr[i];
    }
}
