#include<bits/stdc++.h>
using namespace std;
#define ll long long
#define nl '\n'
int main(){
	int i = 10;
	int *p = &i;
	int **p2 = &p;
	cout<<&i<<nl;
	cout<<p2<<nl;
	cout<<&p<<nl; 
	cout<<nl;

	cout<<p<<nl;
	cout<<*p2<<nl;
	cout<<nl;

	cout<<i<<nl;
	cout<<*p<<nl;
	cout<<**p2<<nl;
}
