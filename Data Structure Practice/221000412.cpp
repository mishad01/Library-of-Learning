#include<bits/stdc++.h>
using namespace std;
class node
{
public:
	int data;
	node* next;
};
node* creation(int n)
{   node* start;
	node* temp;
	node* ptr;
	for(int i=0;i<n;i++)
	{
		temp=new node();
		if(i==0)
		{
			int n;
			start=temp;
			cin>>n;
			temp->data=n;
            temp->next=NULL;
		}
		else
		{
		    int m;
            cin>>m;
            temp->data=m;

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
node* insert_head(node* head,int n)
{
	node* temp=new node();
	temp->data=n;
	temp->next=head;
	head=temp;
	return head;
}
node* insert_at_tail(node* head,int n)
{
	node*temp;
	node* ptr;
    while(n--)

    {
    	temp=new node();
    	cin>>temp->data;
    	temp->next=NULL;
    	if(head==NULL)
    	{
    		head=temp;
    	}
    	else{

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
node* insert_nth(node*head,int pos,int num)
{
	node*temp;
	node* ptr;

	temp=new node;
	temp->data=num;
	if(pos==0)
	{
	    temp->next=head;
		head=temp;
		return head;
	}
	else
	{
		ptr=head;
		for(int i=0;i<pos;i++)
		{
			ptr=ptr->next;
		}
		temp->next=ptr->next;
		ptr->next=temp;
		return head;
	}

}
node* delete_head(node* head)
{
	node* temp=head;
	head=head->next;
	delete temp;
	return head;

}
node* delete_at_end(node* head)
{
	node* ptr;
	ptr=head;
	while(ptr->next->next!=NULL)
	{
		ptr=ptr->next;
	}
	delete ptr->next;
	ptr->next=NULL;
	return head;
}
node* delete_at_nth(node* head,int pos)
{
	node* temp;
	node* ptr;
	if(pos==0)
	{
		temp=head;
		head=head->next;
		delete temp;
	}
	else
	{
		ptr=head;
		for(int i=0;i<pos;i++)
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
		cout<<ptr->data<< " ";
		ptr=ptr->next;
	}
}
int main()
{
	node* head=NULL;


	head=creation(4);
	cout<<"Creation : ";
	display(head);


	cout<<endl<<"Insert at Head : ";
	head=insert_head(head,1);
	display(head);


	cout<<endl<<"Insert at Tail : ";
	head=insert_at_tail(head,1);
	display(head);


	cout<<endl<<"Insert at nth position: ";
	head=insert_nth(head,3,4);
	display(head);


	cout<<endl<<"Delete head: ";
	head=delete_head(head);
	display(head);


	cout<<endl<<"Delete head: ";
	head=delete_at_end(head);
	display(head);

	cout<<endl<<"Delete at nth position: ";
	head=delete_at_nth(head,2);
	display(head);
}
