#include<iostream>
//#include<stdio.h>
using namespace std;
#define endll cout<<endl
#define m 100
int a[m];
int top=-1;
void push(int x)
{
	if(top==m-1)
	{
		cout<<"Stack Overflow"; 
	}
	top++;
	a[top]=x;
}
void pop()
{
	if(top==-1)
	{
		cout<<"Stack Empty"<<endl;
	}
	top--;
	cout<<endl<<"Popped"<<endl;
}
int Top()
{
	return top;
	endll;
}
void displayall ()
{
	for(int i=top;i>=0;i--)
	{  
		cout<<a[i]<<" ";
	}
}
int postfix(string symbol)
{
	for(int i=0;i<symbol.size();i++)
}
int main()
{
	

}