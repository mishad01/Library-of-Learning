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
    cout<<"Output : "<<endl;
    for (i=0;i<5;i++)
    {
        cout<<arr[i]<<endl;
    }

}
