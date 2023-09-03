#include<iostream>
#include<string.h>
using namespace std;
void display(char *text)
{
    int i;
    int f[256]={0};
    int len = strlen(text);
    int max = 0;

    for (i=0;i<len;i++)
    {
        f[text[i]]++;
    }

    for (i=0;i<256;i++)
    {
      if (max<f[i])
            max=f[i];
    }
    for (i=0;i<256;i++)
    {
        if (max==f[i])
        {
            char c = i;
            cout<<c<< " : "<<max<<endl;
        }
    }


}
int main ()
{
    char a[100];

    cout<<"Input your name"<<endl;
    cin.get(a,100);

    display(a);
    return 0;
}

