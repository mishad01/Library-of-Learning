#include<bits/stdc++.h>
using namespace std;
int index(string txt,string pat)
{
    int i,j=0,index,x,y;
    x=txt.size();
    y=pat.size();
    for (i=0;i<=x-y;i++){
        for (j=0;j<y;j++)
    {
        if (txt[i+j]!=pat[j])
            break;
    }
    if(j==y)
    {
        index=i;
    }
    }
    return index;
}
string substring (string txt,int pos,int len)
{
    int i,j;
    string sub  ;
    for (i=pos;i<pos+len;i++)
    {
        sub=sub+txt[i];
    }
    return sub;

}
int main ()
{
    string s ="we the people";
    string t = "of the united states";

    cout<<substring("University",0,3)<<endl;
    cout<<"Index :"<<index("misahd","ahd")<<endl;
}
