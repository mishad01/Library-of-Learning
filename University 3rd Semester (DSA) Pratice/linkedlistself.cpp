#include<bits/stdc++.h>
using namespace std;
class node
{
public:
    int data;
    node* next;
};
node* head;

void insert(int x)
{
    node* temp=new node;
    temp->data;
    temp->next=head;
    head=temp;
}
int print()
{
    node* temp =head;
    while(temp!=NULL)
    {
        cout<<temp->data<<" ";
        temp=temp->next;
    }
    cout<<endl;
}
int main ()
{
    head=NULL;
    cout<<"How many Numbers"<<endl;
    int i,n,x;
     scanf("%d",&n);
    for(i=0; i<n; i++)
    {
        scanf("%d",&x);
        insert(x);
        print();
    }
}
