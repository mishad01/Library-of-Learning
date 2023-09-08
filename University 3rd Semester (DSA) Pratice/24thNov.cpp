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
node* insert_head (node* head,int n)
{
	node* temp=new node();
	temp->data=n;
	temp->next=head;
	head=temp;
	return head;
}
node* insert_nth(node* head,int pos,int n)
{
	node* temp=new node();
	temp->data=n;
	node* ptr;
	if(pos==0)  
	{
		temp->next=head;
		head=temp;
		return head;
	}
	
	ptr=head;
	for(int i=0;i<pos-1;i++)
	{
		ptr=ptr->next;
	}
	temp->next=ptr->next;
	ptr->next=temp;
	return head;


}
node* delet(node* head)
{
  node *temp=head;
  head=head->next;
  delete temp;
  return head;
}
node* delete_tail(node* head)
{
	node* ptr=head;
	while(ptr->next->next!=NULL)
	{
		ptr=ptr->next;
	}
	 

}
node* delete_nth(node* head,int n)
{
	node* ptr=head;
	node* temp;
	if(n==0)
	{
		head=head->next;
		free(ptr);
	}
	else
	{
		for(int i=0;i<n-1;i++)
		{
			ptr=ptr->next;
		}
		temp=ptr->next;
		ptr->next=temp->next;
		delete temp;

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
	head=insert_tail(head,4);
	display(head);
	node* head1=head;
	head1=insert_head(head1,5);
	cout<<endl<<"Insert at head: ";
	display(head1);
	cout<<endl<<"Insert at nth: ";
	head1=insert_nth(head1,0,7);
	display(head1);
	cout<<endl<<"Delete: ";
	head1=delet(head1);
	display(head1);
	/*cout<<endl<<"Delete AT TAIL: ";
	head1=delete_tail(head1);
	display(head1);*/
	cout<<endl<<"Delete AT nth: ";
	head1=delete_nth(head1,0);
	display(head1);

}
