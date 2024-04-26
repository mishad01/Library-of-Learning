#include<bits/stdc++.h>
using namespace std;
#define ll long long
#define nl '\n'
int main(){
	int a = 2;
	cout<<&a<<nl;
	int *p = &a;
	cout<<p<<nl ;
	cout<< *p<<nl;
	cout<<sizeof(p);
	
	//cout<<a; 
}
