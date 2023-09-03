#include<iostream>
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
	//cout<<"Popped"<<endl;
}
void display ()
{
    if(top>=0)
    {
        cout<<"Stack elements are:";
        for(int i=0;i<=top;i++)

            cout<<a[i]<<" ";
            cout<<endl;


    }
    else
        cout<<"stack empty";
}
int postfix(string symbol)
{
	for(int i=0;i<symbol.size();i++)
	{
		if(symbol[i]=='+')
		{
			int num1=a[top];
			pop();
			int num2=a[top];
			pop();
			int c=num1+num2;
			push(c);
			display();
		}
		else if(symbol[i]=='-')
		{
			int num1=a[top];
			pop();
			int num2=a[top];
			pop();
			int c=num1-num2;
			push(c);
			display();
		}
		else if(symbol[i]=='*')
		{
			int num1=a[top];
			pop();
			int num2=a[top];
			pop();
			int c=num1*num2;
			push(c);
			display();
		}
		else if(symbol[i]=='/')
		{
			int num1=a[top];
			pop();
			int num2=a[top];
			pop();
			int c=num1/num2;
			push(c);
			display();
		}
		else
		{  
			int n=symbol[i]-'0';
			push(n);
			display();
		}
	}
	//return a[top];

}
int main()
{
	string s;
	getline(cin,s);
	postfix(s);
}