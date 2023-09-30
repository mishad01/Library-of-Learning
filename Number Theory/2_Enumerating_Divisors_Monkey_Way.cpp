//Normal way of finding divisiors of a Number
//Divisor = In the case of 10 divided by 1,2,5 WHERE 1,2,5,10 is a divisor of 10 because 10 divided by 1,2,5,10 with no remainder.
#include<bits/stdc++.h>
using namespace std;
int main () {
	int n;
	cin >> n;
	for (int i = 1; i <= n; i++) {
		if (n % i == 0) {
			cout << i << endl;
		}
	}
}

/*Here we learned how to find and print all the divisors of a given number 'n'. Here's a concise explanation:

Input a number 'n'.
Iterate from 1 to 'n'.
Check if each number in the range evenly divides 'n'.
If yes, print it as a divisor of 'n'.
The code helps you list all the positive integers that divide 'n' without leaving a remainder./*