#include<bits/stdc++.h>
using namespace std;
class Node
{
    public:
    int data;
    Node* next;
};

int search_linked(Node *head,int num)
{
    Node *temp = head;
    int i=1;
    Node *loc = NULL;
    while(temp!=NULL)
    {
        if(temp->data==num)
        {
            return i;
        }
        temp= temp->next;
        i++;
    }
    return -1;
}

Node *insert_tail(Node *head,int n)
{
    Node *temp = NULL;
    Node *ptr = NULL;
    while(n--)
    {
        temp=new Node();
        cin>>temp->data;
        if(head==NULL)
        {
            head = temp;
        }
        else
        {
            ptr = head;
            while(ptr->next!=NULL)
            {
                ptr=ptr->next;
            }
            ptr->next = temp;
        }
    }
    return head;
}
Node* insert_head(Node *head,int n)
{
    Node *temp;
    while(n--)
    {
        temp = new Node();
        cin>>temp->data;
        temp ->next =head;
        head = temp;
    }
    return head;
}

Node* insert_node_nth(Node *head,int n,int num)
{
    Node *temp = new Node();
    temp->data = num;
    Node *ptr;
    if(n==0)
    {
        temp->next = head;
        temp = head;
        return head;
    }
    ptr = head;
    for(int i=0; i<n-1; i++)
    {
        ptr=ptr->next;
    }
    temp->next = ptr->next;
    ptr->next = temp;
    return head;
}

void print_linked(Node *head)
{
    Node *temp = head;
    while(temp!=NULL)
    {
        cout<<temp->data<<" ";
        temp = temp->next;
    }
}
Node* add_tail(Node *head,int value)
{
    Node *temp = new Node();
    Node *ptr;
    temp->data = value;
    if(head==NULL)
    {
        head = temp;
    }
    else
    {
        ptr = head;
        while(ptr->next!=NULL)
        {
            ptr = ptr->next;
        }
        ptr->next = temp;
    }
    return head;
}
Node *add_head(Node *head,int value)
{
    Node *temp = new Node();
    temp->data = value;
    temp->next = head;
    head = temp;
    return head;
}

Node *insert_sorted_linked(Node *head,int num)
{
    Node *temp = new Node();
    temp->data = num;
    Node *ptr;
    ptr = head;
    if(num<head->data)
    {
        temp->next = head;
        head = temp;
    }
    else
    {
        while(ptr->next!= NULL && ptr->next->data < num)
        {
            ptr = ptr->next;
        }
        temp->next = ptr->next;
        ptr->next = temp;
    }
    return head;
}

Node* delete_head(Node *head)
{
    Node *temp = head;
    head = temp->next;
    free(temp);
    return head;
}
Node *delete_tail(Node *head)
{
    Node *ptr = head;
    while(ptr->next->next!=NULL)
    {
        ptr= ptr->next;
    }
    free(ptr->next);
    ptr->next = NULL;
    return head;
}

Node *delete_linked_nth(Node *head,int n)
{
    Node *ptr = head;
    Node *temp;
    if(n==0)
    {
        head = ptr->next;
        free(ptr);
    }
    else
    {
        for(int i=0; i<n-1; i++)
        {
            ptr= ptr->next;
        }
        temp = ptr->next;
        ptr->next = temp->next;
        free(temp);
    }
    return head;
}


main()
{
    Node *head1 = NULL;
    head1 = insert_tail(head1,4);
    //head1=add_head(head1,3);
   // head1 = delete_head(head1);
    head1 = delete_linked_nth(head1,2);
    print_linked(head1);

}
