#include<bits/stdc++.h>
using namespace std;
#define n 100
int a[n];
int front=-1;
int rear =-1;
void enqueue(int num)
{
	if(front==0 && rear==n-1)
	{
		cout<<"Stack is full";
		return;
	}
	else
	{
		front=0;
		rear++;
		a[rear]=num;
	}
}
void dequeue()
{
	int x=-1;
	if(rear==front)
	{
		cout<<"Queue is empty";
	}
	else
	{
		front++;
		x=a[front];
	}
}
void display()
{
	for(int i=front;i<=rear;i++)
	{
		cout<<a[i]<<" ";
	}
}
int main ()
{
	enqueue(1);
	enqueue(2);
	enqueue(3);
	enqueue(4);
	
	display();
	cout<<endl;
    dequeue();
    //dequeue();
    cout<<endl;
    display();
}
