#include<bits/stdc++.h>
using namespace std;
#define newline cout<<endl;
#define m 100
int a[m];
int top=-1;
int push(int a[],int top,int n,int num)
{
	if(top==m-1)
	{
		cout<<"Stack overflow"<<endl;
	}
	top++;
	a[top]=x;
	return top;
}
int pop()
{
	if(top==-1)
	{
		cout<<"No element to pop"<<endl;
	}
	top--;
	return top;
}
int Top()
{
	cout<<"After delete: "<<a[top];
}
void display()
{
	//cout<<"Stack: "<<endl;
	cout<<a[top];
	newline
}
class stack
{
	int data;
	stack* next;
};
/*stack* push(stack* top,int n)
{
	int count =0;
	stack* temp;
	stack* ptr;
	temp= new stack();
	temp->data=n;
	temp->next=top;
	top=temp;
	return top


}*/
int main()
{
	int n
	int ar[]
	push

}