#include<bits/stdc++.h>
using namespace std;
class node
{
public:
    int info;
    node *next;

};
int main ()
{
    node *start;
    node *ptr;
    node *one;
    node *two;
    node *three;
    node *four;

    one=new node();
    two=new node();
    three =new node();
    four =new node();

    one->info    = 10;
    two->info    = 20;
    three->info  =30;
    four -> info =40;

    one->next=two;
    two->next=three;
    three->next =four;
    four->next =NULL;

    start=one;
    ptr=start;

    while(ptr!=NULL)
    {
        cout<<ptr->info<<endl;
        ptr=ptr->next;
    }


}
