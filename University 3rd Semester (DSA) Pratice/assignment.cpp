#include<bits/stdc++.h>
using namespace std;
class node{
public:
	int data;
	node* next;
};
void display(node* head)
{
	int count=0;
	node* ptr;
	ptr=head;
	while(ptr!=NULL)
	{
		cout<<ptr->data<< " ";
		ptr=ptr->next;
		count++;
		
	}  
	cout<<endl<<"Total : "<<count++;
}
node* creation(int n)
{
	node* start;
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
			if(ptr->next  !=NULL)
			{
				ptr=ptr->next;
			}
			ptr->next=temp;

		}
	}

	return start;

}


int main ()
{
	node* head=NULL;
	head=creation(3);
	display(head);
	cout<<endl;
	
}    