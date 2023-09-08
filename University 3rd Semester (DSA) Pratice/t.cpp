#include<bits/stdc++.h>
using namespace std;
int main ()
{
    string dreamcode;
    cin>>dreamcode;
    string s = " ";
    for(int i=0;i<dreamcode.size();i++)
    {
        if(dreamcode[i]=='-' && dreamcode[i+1]=='.')
        {
            s +='2';
            i += 1;
        }
        else if(dreamcode[i]=='-' && dreamcode[i+1]=='-')
        {
            s +='3';
            i += 1;
        }
        else{
            s +='1';
        }
    }
    cout<<s<<endl;
    return 0;
}
