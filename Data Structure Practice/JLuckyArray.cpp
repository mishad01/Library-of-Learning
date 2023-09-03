#include<bits/stdc++.h>
using namespace std;
int main ()
{
	int n;
	int count=0;
	cin>>n;
	long long a[n];;
	int min=100001;
	for(int i=0;i<n;i++)
	{
		cin>>a[i];
		if(a[i]<min)
		{
			min=a[i];
		}
	}
	for(int i=0;i<n;i++)
	{
		
		if(a[i]==min)
		{
			count++;
		}
	}
	if(count%2!=0)
	{
		cout<<"Lucky";
	}
	else
	{
		cout<<"Unlucky";
	}
    
	

}