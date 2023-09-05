#include<bits/stdc++.h>
using namespace std;
const int N = 1e5+9; //10^5+9
bool f[N];
int main(){
	int n;cin>>n;
	f[1]=true;
	vector<int>v;
	for(int i = 2;i<=n;i++){
		if(f[i]==false){
			v.push_back(i);
			for(int j = i+i;j<=n;j=j+i){
				cerr<<j<<endl;
				f[j]=true;
			}
		}
	}
	for(auto x : v){
		cout<<x<<" ";
	}
}

//Here for(int j = i+i;j<n;j=j+i) this condition mainly going for 2 to 4 then 4 to 6 , 6 to 8..It's mainly make false the divisor of 2
 //1 2 3 4
 //5 6 7 8
 //9 10 11 12
 //13 14 15 1/*
/*he given code appears to be an implementation of the Sieve of Eratosthenes algorithm to find prime numbers up to a given positive integer 'n'. Here's what we can learn from this code:

It defines a constant N as 10^5 + 9 (1e5 + 9), which is likely an upper limit for the range of numbers to consider for prime number generation.

It initializes a boolean array f of size N, where each element represents whether a number is marked as composite (false for prime, true for composite).

It reads an integer n from the standard input, which represents the upper bound for finding prime numbers up to 'n'.

It initializes f[1] as true since 1 is not a prime number.

It uses a vector v to store the prime numbers found during the iteration.

The code then iterates through numbers from 2 to n. If f[i] is false (indicating that 'i' is prime), it appends 'i' to the vector v and marks all multiples of 'i' as composite by setting f[j] to true for j starting from i + i and incrementing by i until j is less than 'n'.

After the loop, it prints the prime numbers stored in the vector v.*/