#include<bits/stdc++.h>
using namespace std;
#define newline cout<<endl;
#define M 101
int top=-1;
int A[M];

void push(int x)
{
	if(top==M-1)
	{
		cout<<"Stack Overflow"<<endl;
	}
	top++;
	A[top]=x;
}
void pop()
{
	if(top==-1)
	{
		cout<<"No element to pop"<<endl;
		return;
	}
	top--;    

}
int Top()
{
	return A[top];
}
void display()
{
	//cout<<"Stack: "<<endl;
	cout<<A[top];
	newline
}

int main ()
{
	cout<<"Stack: "<<endl;
	push(2);
	display();
	push(3);
	display();
	push(4);
	display();
	pop();
	display();

}
