#include<iostream>
using namespace std;
int front=-1;
int rear=-1;
#define n 100
int a[n];
void enqueue(int x)
{
	if(front==0 && rear==n-1)
	{
		cout<<"Queue is full";
		return ;
	}
	rear++;
	a[rear]=x;
    if(front==-1)
    {
    	front++;
    }
	
}
int dequeue()
{
	int x=-1;
	if(front==rear)
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
	for(int i=front ;i<=rear;i++)
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
    dequeue();
    cout<<endl;
    display();
}
