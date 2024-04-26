#include<bits/stdc++.h>
using namespace std;
#define ll long long
#define nl '\n'
/*void print(int* p){
	cout<<*p<<nl;
}
void incrementPointer (int *p){
	p = p+1;
}
void incr(int *p){
	(*p)++;
}
int main(){
	int i = 20;
	int *p = &i;

	print(p);
	cout<<p<<nl;
	incrementPointer(p);
	cout<<p<<nl;

	cout<<*p<<nl;
	incr(p);
	cout<<*p;

}*/
int sum(int a[],int size){
	int ans = 0;
	for(int i = 0;i<size;i++){
		ans+=a[i];
	}
	return ans;
}
int main(){
	int a[10];
	cout<<sizeof(a)<<nl;
	cout<<sum(a,10)<<nl;
}
