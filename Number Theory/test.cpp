#include<bits/stdc++.h>
using namespace std;
const int N = 1e7+9;
#define e "\n"
bool f[N];
int main(){
	int n = n-9;
	auto st = clock();
	//cin>>n;
	f[1]=true;
	vector<int>v;
	for(int i = 2;i<=n;i++){
		if(f[i]==false){
			v.push_back(i);
			for(int j = i+i;j<=n;j=j+i){
				f[j]=true;
			}
		}
	}
	// for(auto x : v){
	// 	cout<<x<<" "<<e;
	// }
	cout<<v.size()<<e;
	cerr<<1.0 * (clock() - st)/CLOCKS_PER_SEC<<e;


}