#include<bits/stdc++.h>
using namespace std;
class node
{
public:
    int info;
    node* next;

    node(int value){
       info = value;
       next=NULL;
    }
};
void insertatTail(node* &head,int value){
    node* start=new node(val);
    if(head==NULL){
        head=start;
        return;
    }

    node* ptr=head;
    while(ptr->next!=NULL)
    {
       ptr = ptr->next; 
    }
    temp->next=start
}



