#include<iostream>
#include<string.h>
#include<stdio.h>
using namespace std;

void element(char *text)
{
  int f[256]={0};
  int i;
  int len =strlen(text);
  int m = 0;

  for (i=0;i<len;i++)
  {
      f[text[i]]++;
  }
  for (i=0;i<256;i++)
  {
     if (f[i]!= 0)
     {
        char c = i;
        cout<<c <<" : " <<f[i]<<endl;;
     }
  }


}

int main ()
{
    char name[100];

    cout<<"Input your name"<<endl;
    cin.get(name,100);

    element(name);
    return 0;
}
