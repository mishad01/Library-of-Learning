#include<bits/stdc++.h>
using namespace std;
class node
{
public:
    int data;
    node *next;
};

node* insertattail(node* start,int n)
{
    node* temp;
    node* ptr;

    while(n--)
    {
        temp=new node();
        cin>>temp->data;
        if(start==NULL)
        {
            start=temp;
        }
        else
        {
            ptr=start;
            while(ptr->next!=NULL)
            {
                ptr=ptr->next;
            }
            ptr->next=temp;
        }
    }
    return start;
}
node *atstart(node* start,int n)
{
    node* temp=new node();
    temp->data=n;
    temp->next=start;
    start=temp;
    return start;
   
}
node* nth(node* head,int n,int num)
{
    node* temp=new node();
    temp->data=num;
    node* ptr;
    ptr=head;
    for(int i=0;i<n;i++)
    {
        ptr->next;
    }
}
node* delet(node* head,int n)
{
    node* temp;
    
}

void dispaly(node* head)
{
    node* temp=head;
    while(temp!=NULL)
    {
        cout<<temp->data;
        cout<<endl;
        temp=temp->next;
    }

}

int main()
{
  node* head=NULL;
  
  head=insertattail(head,4);
  //head=atstart(head,0);

  dispaly(head);

}