#include<bits/stdc++.h>
using namespace std;
class node
{
public:
	node* prev;
	int data;
	node* next;
};
node* creation(node* head,int n)
{
	node* temp;
	node* ptr;
	while(n--)
	{
		temp= new node();
		cin>>temp->data;
		if(head==NULL)
		{
			head=temp;
			head->next=NULL;
			head->prev=NULL;
		}
		else
		{
			ptr=head;
			while(ptr->next!=NULL)
			{
				ptr=ptr->next;
			}
			ptr->next=temp;
			temp->prev=ptr;
		}
	}
	return head;
}
void display(node* head)
{
	node* ptr=head;
	while(ptr!=NULL)
	{
		cout<<ptr->data<<" ";
        ptr=ptr->next;
	}
}

int main ()
{
	node* head=NULL;
	head=creation(head,3);
	display(head);
}