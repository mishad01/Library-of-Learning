//Except 1 and n we can't get any other divisor for prime
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