#include<bits/stdc++.h>
using namespace std;
class node{
public:
	int data;
	node *next;
};

node* createattail(node* start,int n)
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
void display(node *head)
{
	node* ptr=head;
	while(ptr!=NULL)
	{
		cout<<ptr->data<<endl;
		ptr=ptr->next;
	}
}

int main ()
{
	node* head=NULL;
	head=createattail(head,3);
	display(head);

}