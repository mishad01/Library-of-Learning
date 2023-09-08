#include<iostream>
using namespace std;
class node
{
public:
	int data;
	node* left;
	node* right;
};
node* treecreation(int num)
{
	node* temp=new node();
	temp->data=num;
	temp->left=NULL;
	temp->right=NULL;
}
void preorder(node* head)
{
	if(head!=NULL)
	{
		cout<<head->data<< " ";
		preorder(head->left);
		preorder(head->right);

	}
}
void postorder(node* head)
{
	if(head!=NULL)
	{
		postorder(head->left);
		postorder(head->right);
		cout<<head->data<< " ";
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
	node* root=treecreation(1);
	root->left=treecreation(2);
	root->right=treecreation(3);
	root->left->left=treecreation(4);
	root->left->right=treecreation(5);
	inorder(root);

}
