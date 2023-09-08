  #include<bits/stdc++.h>
using namespace std;
class node
{
    public:
    int data;
    node* next;
};
node* creation(int n)
{
    node* head;
    node* temp;
    node* ptr;
    for(int i=0;i<n;i++)
    {
        if(i==0)
        {
            int n;
            cin>>n;
            head=temp;
            temp->data=n;
            temp->next=NULL;
        }
        else
        {
            int m;
            cin>>m;
            temp->data=m;
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
node* insertattail(node *first,int n)
{
  node* temp=NULL;
  node* ptr=NULL;
  while(n--)
  {
    temp=new node();
    cin>>temp->data;
    temp->next=NULL;
    if(first==NULL)
    {
       first=temp;       //10
    }
    else{
        ptr=first;
        while(ptr->next!=NULL)
        {
            ptr=ptr->next;
        }
        ptr->next=temp;
    }
  }
  return first;
}
void printlinked(node *head)
{
    node *temp = head;
    while(temp!=NULL)
    {
        cout<<temp->data<<endl;;
        temp = temp->next;
    }
}

main()
{
    node *head1 = NULL;
    head1 = creation(3);
    //cout<<endl;
    printlinked(head1);

}
