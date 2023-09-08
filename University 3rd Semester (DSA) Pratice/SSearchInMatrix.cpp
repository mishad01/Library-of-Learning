#include<bits/stdc++.h>
using namespace std;
int main()
{
    int i,j;
    int a[100][100];
    int r,c;
    cin>>r>>c;
    ;
    for(i=0;i<r;i++)
    {
        for(j=0;j<c;j++)
        {
            cin>>a[i][j];
        }
    }
    int search;
    cin>>search;
    bool token=false;
    for(i=0;i<r;i++)
    {
        for(j=0;j<c;j++)
        {
            if(a[i][j]==search)
            {
                token=true;
                break;
            }
           
        }
        
    }
    if(token)
    {
        cout<<"will not take number";
    }
    else
    {
        cout<<"will take number";

    }
    
}