#include<bits/stdc++.h>
using namespace std;
bool test(int n){
	int res;
	bool zz;
        for(int i = 1;i<n;i++){
            res = (i*i*i);
            cerr<<res<<endl;
            if(res==n){
            	zz=true;
            	return true;
            	break;
            }
          }
          if(zz!=true){
          	return false;
          }
}
int main()
{
	int x;
   cin>>x;
   cout<<test(x);
}
