//Except 1 and n we can't get any other divisor for prime
//It's mainly for finding the prime number
//Time complexity for this is O(√n).
#include<bits/stdc++.h>
using namespace std;
bool is_prime(int n){
	for(int i = 2;i*i<=n;i++){ //Here dont get confused.The iteration for i++ will be 3 when (i*i) 2*2 = 4<=n,iteration for i++ will be 4 when (i*i) 3*3 = 9<=n
		cerr<<n<<" "<<i<<endl;
		if(n%i==0){
			return false;
		}
	}
	return true;
}
int main(){
	cout<<is_prime(20);
	
}
