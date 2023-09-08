#include<bits/stdc++.h>
using namespace std;
int main ()
{
  int n;
  cin>>n;
  int k=n;
  int a[n];
  int b[k];

  for(int i=0;i<n;i++)
  {
      cin>>a[i];
  }

  for(int i=0;i<n;i++)
  {
      if(a[i]==a[n-1-i])

      {
          cout<<"YES";
          break;
      }
      else{
        cout<<"NO";
        break;
      }
  }


}
