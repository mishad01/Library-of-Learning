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
/*void display()
{
	cout<<a[top];
	endll;
}*/

/*class stack
{
public:
	int data;
	stack* next;
};
stack* top=NULL;

void push(int num)
{
	stack* temp;
	temp=new stack();
	temp->data=num;
	temp->next=top;
	top=temp;
}
void pop()
{
	if(top==NULL)
	{
		cout<<"Stack Empty"<<endl;
	}
	stack* temp=top;
	top=top->next;
	delete temp;
	cout<<"After popped, top is"<<endl;

}
int Top()
{
	return top;
	endll;
}
void display()
{
	cout<<top->data<< " ";

}*/   
void displayall ()
{
	for(int i=top;i>=0;i--)
	{  
		cout<<a[i]<<" ";
	}
}
int main()
{
	push(1);
	 
	push(2);
	
	push(3);

	push(4);
	displayall();
	pop();
	displayall();


	


}