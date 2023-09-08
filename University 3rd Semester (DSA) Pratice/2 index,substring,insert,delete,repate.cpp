#include<bits/stdc++.h>
using namespace std;
int index(string txt,string pat)
{
    int i,j,x,y,index=-1;
    x=txt.size();
    y=pat.size();
    for (i=0;i<x;i++)
    {
        for (j=0;j<y;j++)
        {
            if(txt[i+j]!=pat[j])
                break;
        }
        if(j==y)
            index =i;

    }
   return index;
}
string substring(string txt,int pos,int len)
{
    int i,j=0;
    string sub;
    for (i=pos;i<pos+len;i++)
    {
        sub=sub+txt[i];
    }
    return sub;
}
string inserting(string txt,int pos,string add)
{
    string t = substring(txt,0,pos);
    t=t+add;
    string s = substring(txt,pos,txt.size()-pos);
    t=t+s;
    return t;
}
string delet(string txt,int pos,int len)
{
    string a = substring(txt,0,pos);
    string b = substring(txt,pos+len,txt.size()-pos-len);//s
    string c = a+b;
    return c;
}
string replac(string txt,string rep,string add)
{
    int k = index(txt,rep);
    if (k!=-1)
    {
        string m =delet(txt,k,rep.size());
        string n =inserting(m  ,k,add);
        return n;
    }
}
string rotat(string txt,int pos)
{
    int i;
    string sub;
    for (i=0;i<pos;i++)
    {
        sub=sub+txt[i];
    }
  string a = delet(txt,0,pos);
  string b = inserting(a,txt.size()-pos,sub);


  return b;
}
int main ()
{
    string a = "University";
    string b = "versity";
    int c = index(a,b);
    if(c==-1)
    {
        cout<<"pat not found"<<endl;
    }
    else
        cout<<"Pattern found at index : "<<c<<endl;


    cout<<"Substring : "<<substring("University",3,7)<<endl;
    cout<<"Insert : "<<inserting("University",3, " of bangladesh")<<endl;
    cout<<"Delete : "<<delet("JOHN PAUL JONES",6,5)<<endl;
    cout<<"Replace : "<<replac("Bluetaathaa","aa","oo")<<endl;
    cout<<"Rotate :"<<rotat("ABCDEF",2);


}
