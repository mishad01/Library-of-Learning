//12 = 2 x 2 x 3
//20 = 2 x 2 x 5
//In Skeleton View so basically we have to find the prime factor of a number which is equal to n .
#include<bits/stdc++.h>
using namespace std; 
int main(){
	int n;cin>>n;
	vector<int>v;
	for(int i = 2;i*i<=n;i++){
		cerr<<i<<endl;
		if(n%i==0){
			while(n%i==0){    // 20%2==0,10%2==0,5%2!=0 (Now it will come out from the loop and will go to the line 19)    
				v.push_back(i); // it(1)20/2 = 10, it(2) 10/2 = 5,
				n=n/i;
			}
		}

	}
	// n=5 so n>1 
	if(n>1) //Basically if we see the number is > 1 then we are sure that last n value is prime.Because i*i is square root but even after if it dosen't divide then its obvious that its a prime number
	{
		v.push_back(n);
	} 
	for(auto x : v){
		cout<<x<<" "<<endl;
	}
}

//Input : 20
//Output : 2 2 5

/*
Let's use the input n = 20 to understand how the code works:

1.The code starts by reading an integer 'n' from the user, which is set to 20 in this example.

2.It uses a for loop to iterate through values of 'i' starting from 2 up to the square root of 'n' (i * i <= n). This is an optimization to find factors efficiently.

3.Inside the loop:

-It checks if 'n' is divisible by 'i' (n % i == 0). In this example, 20 is divisible by 2.
-If 'n' is divisible by 'i', it enters a while loop.
-Within the while loop, it repeatedly divides 'n' by 'i' while 'n' is still divisible by 'i'. This is done to find all the instances of 'i' as a prime factor of 'n' and push them into the vector 'v'. In the example, it pushes 2 twice because 20 can be divided by 2 twice (20/2 = 10, 10/2 = 5).
4.After the for loop, it checks if 'n' is still greater than 1. If 'n' is greater than 1, it means that 'n' itself is a prime factor, so it is pushed into the vector 'v'.

5.Finally, the code prints the prime factors stored in the vector 'v'.
*/