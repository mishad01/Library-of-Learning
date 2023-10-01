#include<bits/stdc++.h>
using namespace std;
int main () {
	int n;
	cin >> n;
	vector<int>v;
	for(int i = 2;i*i<=n;i++){
		cerr<<i<<endl;
		if(n%i==0){
			//cerr<<n<<endl;
			while(n%i==0){ // to get the square value we take this. Ex 2^2 ,3^3
				v.push_back(i);
				n/=i;
				//cerr<<n<<endl;
			}
		}
	}
	if(n>1)
		v.push_back(n);
	for(auto x : v){
		cout<<x<<endl;
	}
}