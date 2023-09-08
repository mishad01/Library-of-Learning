#include<bits/stdc++.h>
using namespace std;
int index(string txt,string pat)
{
    int x = txt.size();
    int y=  pat.size();
    int i,j;
    int index = -1;
    for (i=0; i<=x-y; i++)
    {
        for (j=0; j<y; j++)
        {
            if(txt[i+j]!=pat[j])
                break;
        }
        if(j==y)
        {
            index=i;
        }
    }

    return index;


}
string substring(string name,int pos,int len)
{
    int i;
    string sub;
    for (i=pos; i<pos+len; i++)
    {
        sub =sub+name[i];
    }
    return sub;
}
string inserting(string txt,int pos,string sub)
{
    string e=substring(txt,0,pos);
    e=e+sub;
    string f=substring(txt,pos,txt.size()-pos);
    e=e+f;
    return e;
}
string delet (string txt,int pos,int len)
{
    string a = substring(txt,0,pos);
               string b= substring(txt,pos+len,txt.size()-pos-len);
    a=a+b;

    return a;
}

int main ()
{
    string a = "John cena";
    string b = "cena";
    string name = " bro ";
    int i = index(a,b);
    cout<<i<<endl;;

    string s=substring(a,2,2);
    cout<<s<<endl;;


    string in =inserting(a,4,name);
    cout<<in<<endl;

    string d=delet(a,0,5);
    cout<<d;

}
