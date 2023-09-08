#include<iostream>
using namespace std;
#define m=100
int fornt=-1;
int rear =-1;
int a[m];
void enqueue(int n)
{
	if(rear==m-1)
	{
		cout<<"Stack is Empty"<<endl;
	}
	else
	{
	  rear++;
	  a[rear]=n;
	}
}
void dequeue()
{
	if(rear==front)
	{
		cout<<"Queue is empty"<<endl;
	}
	else
	{
		
	}
}
int main ()
{

}