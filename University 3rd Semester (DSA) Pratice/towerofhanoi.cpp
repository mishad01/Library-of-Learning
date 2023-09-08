#include<bits/stdc++.h>
using namespace std;
void hanoi(int n,string first,string mid,string last)
{
	if(n==1)
	{
		cout<<first<<" "<<"to "<<last<<endl;
	}
	else
	{
		hanoi(n-1,first,last,mid);
		cout<<first<<" "<<"to "<<last<<endl;
		hanoi(n-1,mid,first,last);

	}
}
int main ()
{
	string a,b,c;
	cin>>a>>b>>c;
	hanoi(3,a,b,c);
}