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
void display()
{
    for(int i=top;i>=0;i--)
    {  
        cout<<a[i]<<" ";
    }
}
int postfix(string symbol)
{
    for(int i=0;i<symbol.size();i++)
    {
        if(symbol[i]>='0' && symbol[i]<='9')
        {
            push(symbol[i]-'0');
        }
        else
        {
            int num1=a[top];
            pop();
            int num2 =a[top];
            pop();

            switch(symbol[i])
            {
            case'+':
                push(num1+num2);
                break;
            case'-':
                push(num1-num2);
                break;
            case'*':
                push(num1*num2);
                break;
            case'/':
                push(num1/num2);
                break;

            }

        }
    }
    return a[top];
}
int main()
{
    cout<<postfix("46+2/5*7+");

}