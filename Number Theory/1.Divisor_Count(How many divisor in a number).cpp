//This code is to find how many divisor a number have 
#include<bits/stdc++.h>
using namespace std;
int d[100];
int main(){
	int n;
	cin>>n;
	for(int i = 1;i<=n;i++){
		for(int j = i ;j<=n;j=i+j){
			         //for n = 5
			d[j]++; //((d[1]=1 then (j+i)=(1+1)->(2+1)->(3+1)->(4+1) thaat means d[2]=1 ,d[3]=1,d[4]=1,d[5]=1)), 
			         //d[2]= 1 again 1 will be added so d[2]=2 then (j+i)=(2+2) 4 is  d[4]=2 then  (j+i)=(3+3) which is smaller then 5 so loop will break
			         //d[3]=1 again 1 will be added so d[3]=2 then (j+1)=(3+3) break'
			         //d[4] = 2 again 1 will be added d[4]=3 then break;
			         //d[5] = 1 again 1 will be added d[5]= 2 break
		}
	}
	for(int i= 1;i<=n;i++){
		cout<<i<<" have "<<d[i]<<" divisors "<<endl;
	}
}
/*
1 have 1 divisors 
2 have 2 divisors  //1,2
3 have 2 divisors 
4 have 3 divisors  //1,2,4
5 have 2 divisors 
6 have 4 divisors   //1,2,3,6
7 have 2 divisors 
8 have 4 divisors 
9 have 3 divisors 
10 have 4 divisors

 */
