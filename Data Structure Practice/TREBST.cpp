#include<iostream>
using namespace std;
class node
{
public:
	int data;
	node* left;
	node* right;
};
node* root(int num)
{
	node* temp=new node();
	temp->data=num;
	temp->left=NULL;
	temp->right=NULL;
}
node* inorder(node* head)
{
	if(head!=NULL)
	{
		inorder(head->left);
		cout<<head->data<<" ";
		inorder(head->right);
	}
}
node* treebst(node* head,int num)
{
	if(head==NULL)
	{
		head=root(num);
	}
	else if(num<head->data)
	{
		head->left=treebst(head->left,num);
	}
	else 
	{
		head->right=treebst(head->right,num);
	}
}
int main ()
{
	node* root = NULL;
	root=treebst(root,1);
	root=treebst(root,2);
	root=treebst(root,3);
	root=treebst(root,4);
	root=treebst(root,5);
	inorder(root);
}