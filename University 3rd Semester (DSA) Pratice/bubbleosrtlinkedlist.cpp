#include<bits/stdc++.h>
using namespace std;
class node
{
public:
	int data;
	node* next;
};

node* insert_tail(node* head,int n)
{
	node* temp;
	node* ptr;
	while(n--)
	{
		temp=new node();
		cin>>temp->data;
		if(head==NULL)
		{
			head=temp;

		}
		else
		{
			ptr=head;
			while(ptr->next!=NULL)
			{
				ptr=ptr->next;
			}
			ptr->next=temp;
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
node* bubblest(node* head)
{
	node* i;
	node* j;
	int large; 
	int small;
	for(i=head;i->next!=NULL;i=i->next)
	{
		for(j=head;j->next->next!=NULL;j=j->next)
		{
			if(j->data>j->next->data)
			{
				large=j->data;
				small=j->next->data;
				j->data=small;
				j->next->data=large;

			}

		}
	}
	return head;
}
int main ()
{
	node* head=NULL;
	head=insert_tail(head,5);
	display(head);
	cout<<endl<<"BUBBLE: "<<endl;
	node* head1=head;
	head1=bubblest(head1);
	display(head1);

}
