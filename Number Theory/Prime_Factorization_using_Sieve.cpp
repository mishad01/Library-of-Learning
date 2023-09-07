//Find the prime factorixation for n 
#include<bits/stdc++.h>
using namespace std;
const int N = 1e6+9;
int spf[N];
int main(){
	// int n;
	// cin>>n;
	//vector<int>v;
	for(int i = 2;i<N;i++){
		spf[i]=i;
	}
	for(int i = 2 ;i<N;i++){ //Here i is the divisor 
		for(int j = i;j<N;j+=i){ //Here divisor going all of his multiplier like 2,4,6,8 then 
			spf[j]=min(spf[j],i);   //Here as an example i is telling to v[j] that I am your divisor,then minimizing
		                      //Important.Minimum divisor is Lalways prime
		}
	}
	//cout<<spf[10]; //2 is the minimum prime factor of 10
	// Now if we have so many queiries and we have to prime factorize of n

	int q;cin>>q;
	while(q--){
		int n;
		cin>>n;
		vector<int>v;
		while(n>1){
			v.push_back(spf[n]);
			n=n/v[n];
		}
		for(auto x : v){
			cout<<x<<endl;
		}
	}
}