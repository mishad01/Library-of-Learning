#include<iostream>
using namespace std;
#define m 100
int a[m];
int top=-1;
void push(int n)
{
	if(top==m-1)
	{
		cout<<"STACK EMPTY"<<endl;
	}
	else
	{
		top++;
		a[top]=n;
	}
}
void pop()
{
	if(top==-1)
	{
		cout<<"Stack Underflow"<<endl;
	}
	else
	{

		top--;
		cout<<"Popped"<<endl;
	}
}
void display()
{
	int i;
	for(i=0;i<top;i++)
	{
		cout<<a[i]<< " "<<endl;
	}
}
int main ()
{
	push(1);
	push(2);
	push(3);
	push(4);
	push(5);
	display();
}