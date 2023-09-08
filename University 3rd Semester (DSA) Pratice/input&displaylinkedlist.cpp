#include<bits/stdc++.h>
using namespace std;
class node  {
public:
    int data;
    node *next;
};
node *creation(int n)
{
    node* start;
    node* ptr;
    for(int i=1;i<n;i++)
    {
        node *newnode = new node();


            int n;
            cin>>n;
            newnode->data=n;
            ptr=start;
            while(ptr->next!=NULL)
            {
                ptr=ptr->next;
            }
            ptr->next=newnode;

    }
    return start;
}
int main ()
{
    node*head=creation(3);
    node *ptr;
    ptr=head;
    while(ptr!=NULL)
    {
        cout<<ptr->data<<" ";
        ptr = ptr->next;
    }
}
