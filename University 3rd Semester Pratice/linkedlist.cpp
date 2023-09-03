#include<bits/stdc++.h>
using namespace std;
class node{
public:
    int data;
    node* next;
};

int main ()
{
    node* start;
    node*ptr;
    node* one=new node();
    node* two=new node();
    node* three= new node();

    one->data=10;
    two->data=20;
    three->data=30;

    one->next=two;
    two->next=three;
    three->next=NULL;

    start=one;
    ptr=start;

    while(ptr!=NULL)
    {
       cout<<ptr->data<< " ";
       ptr=ptr->next;
    }


}
