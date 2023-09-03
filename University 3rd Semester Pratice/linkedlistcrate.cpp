#include<bits/stdc++.h>
using namespace std;
class node{
    public:
	int data;
	node* next;
};
node* creation(int N)
{
    node* start;
    node* ptr;
    for(int i=0;i<N;i++)
    {
        node* newNode;
        newNode= new node();
        if(i==0)
        {
            int n;
            start=newNode;
            cin>>n;
            newNode->data=n;
            newNode->next=NULL;

        }
        else
        {
            int m;
            cin>>m;
            newNode->data=m;

            ptr=start;
            while(ptr->next!=NULL)
            {
                ptr=ptr->next;
            }
            ptr->next=newNode;

        }
    }
    return start;
}

void printlinked(node* head)
{
    node *temp = head;
    while(temp!=NULL)
    {
        cout<<temp->data<<endl;;
        temp = temp->next;
    }
}

int main ()
{

  node* head=NULL;
  head=creation(5);
  printlinked(head);}