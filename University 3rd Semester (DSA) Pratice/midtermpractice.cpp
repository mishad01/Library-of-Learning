#include<bits/stdc++.h>
using namespace std;
int index(string txt,string pat)
{
	int x=txt.size();
	int y=pat.size();
	int i,j,index=-1;
	for(i=0;i<=x-y;i++)
	{
		for(j=0;j<y;j++)
		{
			if(txt[i+j]!=pat[j])
			{
				break;
			}
		}
		if(j==y)
		{
			index=i;
		}
	}
	return index;
}
string substring(string txt,int pos,int len)
{
	int i,j;
	string sub=NULL;
	for(i=pos;i<txt.size()-pos;i++)
	{
		sub=sub+txt[i]''
	}
	return sub;

}
int main ()
{
	string a="University";
	string b="versity";
	cout<<index(a,b);
	cout<<substring(university,3,7);
}