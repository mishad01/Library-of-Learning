//Humanway of finding divisiors of a Number
//This is How to enumerate the divisors of  n in O(√n) time complexity
/* 
 1 x 100 = 100;
 2 x 50 =  100;
 4 x 25 =  100;
 5 x 20 =  100;
10 x 10 =  100;
a  x  b = n;

so basically in human way the loop will continue till a*b<=n and a<=b 
And we will insert into vector,set or arrary if(n%i==0) and (n/i);
 */
#include<bits/stdc++.h>
using namespace std;
int main(){
	int n;
	cin>>n;
	set<int>s;
	for(int i = 1;i*i<=n;i++){
		if(n%i==0){
			s.insert(i);
			if(i!=n/i)   //This condition ensures that 'i' and 'n/i' are not the same. This is important because if 'i' and 'n/i' are the same, it means 'n' is a perfect square, and adding both 'i' and 'n/i' to the set would result in the same value being added twice. To avoid this duplication, 'i' is only inserted into the set if it's different from 'n/i'.
			s.insert(n/i);
		}
	}
	for(auto x : s){
		cout<<x<<endl;
	}
}
