#include<bits/stdc++.h>
using namespace std;
class node
{
  public:
  int data;
  node *next;

  node(int value){
  	data=value;
  	next=NULL;
  }
}; 

void insertatTail(node* &head,int value){


	node *num= new node(value);
	if(head==NULL)
	{
		head=num;
		return;
	}

	node* temp=head;
	while(temp->next!=NULL){
		temp=temp->next;
	}
	temp->next =num;

}

void display(node* head)
{
	node* temp=head;
	while(temp!=NULL)
	{
	  cout<<temp->data<<" ";
	  temp=temp->next;	
	}
	cout<<endl;
}




int main ()
{
	node* head=NULL;
	insertatTail (head,10);
	insertatTail (head,20);
	insertatTail (head,30);
	display(head);

}