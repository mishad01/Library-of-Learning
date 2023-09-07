//The greatest common divisor (GCD) of two or more integers, which are not all zero, is the largest positive integer that divides each of the integers
//The least common multiple, lowest common multiple, or smallest common multiple of two integers a and b,usually denoted by lcm(a,b)is the smallest positive integer that is divisible by both a and b
//For Gcd if there is a = 2^5,3^2,7^1 b = 2^3 ,3^5,5^6 then gcd = 2^3*3^2 so basically we will take only prime ones (Minimum valu)
//For Gcd if there is a = 2^5,3^2,7^1 b = 2^3 ,3^5,5^6 then LCM = 2^5 x 3^5x 7^1  (maximum)
#include<bits/stdc++.h>
using namespace std;
int gcd(int a,int b){
	if(a<b) swap(a,b);
	if(a==0) return b;
	if(b==0) return a;
	//return gcd(a-b,b);
	return gcd(a%b,b);
}
int main (){
	cout<<gcd(15,18)<<endl;
}