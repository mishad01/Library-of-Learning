#include<iostream>
//#include<bits/stdc++.h>
using namespace std;
class stack
{
public:
	int data;
	stack* next;

};  
stack* top= NULL;
  
void push(int num)
{
	stack* temp=new stack();
	temp->data=num;
	temp->next=top;
	top=temp;
	//return top;
}
void pop()
{
	stack* temp;
	/*if(top==NULL)
	{
		cout<<"Stack is Empty"<<endl;
		return ;
	}
	else{*/
	
	temp=top;
	top=top->next;
	delete temp;
} 


//}

void display()
{
	cout<<top->data;
	cout<<endl;

}
int main ()
{
	push(2);
	display();
	push(3);
	display();
	push(4);
	display();
	pop();
	display();

}