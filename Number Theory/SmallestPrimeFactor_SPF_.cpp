//12 lcm = 2 * 2 * 3 (The least minimum value that we can do)
// From 2 x 2 x 3 we will take 2 because its the smallest
//Smallest Prime Factor(SPF)
//The Skeleton view
#include<bits/stdc++.h>
using namespace std;
bool is_prime(int n){
	for(int i = 2;i*i<=n;i++){
		if(n%i==0){
			return false;
		}
	}
	return true;
}
int main(){
	cout<<is_prime(10);
}