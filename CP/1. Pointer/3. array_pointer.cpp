#include<bits/stdc++.h>
using namespace std;
#define ll long long
#define nl '\n'
int main(){
	int a[10];
	cout<<&a[0]<<nl;
	a[0]=5;
	a[1]=10;
	cout<<*a<<nl;
	cout<<*(a+1)<<nl;
	cout<<sizeof(a);

}
