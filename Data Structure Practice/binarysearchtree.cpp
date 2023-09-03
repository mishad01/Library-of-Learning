#include<iostream>
using namespace std;
class node
{
public:
	int data;
	node* left;
	node* right;
};
node* troot(int num)
{

		node* temp=new node();
	    temp->data=num;
	    temp->left=NULL;
	    temp->right=NULL;
	    return temp;

}
node* treebst(node* root,int num)
{
	if(root==NULL)
	{
		root=troot(num);
	}
	else if(num<root->data)
	{
		root->left=treebst(root->left,num);
	}
	else
	{
		root->right=treebst(root->right,num);
	}
}
void inorder(node* head)
{
	if(head!=NULL)
	{
		inorder(head->left);
		cout<<head->data<< " ";
		inorder(head->right);
	}
}
int main()
{
	node* root=NULL;
	root=treebst(root,1);
	root=treebst(root,5);
	root=treebst(root,2);
	root=treebst(root,4);
	root=treebst(root,3);
	inorder(root);
}
