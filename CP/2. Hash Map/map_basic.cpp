#include<bits/stdc++.h>
using namespace std;
#define ll long long
#define nl '\n'

vector<int> removeDuplicates(int *a,int size){
	vector<int>output;
	unordered_map<int,bool>seen;
	for(int i = 0;i<size;i++){
		if(seen.count(a[i])>0){
			continue;
		}
		seen[a[i]]=true;
		output.push_back(a[i]);
	}
	return output; 
}
int main(){
	unordered_map<string,int>mp;

	//insert
	pair<string,int>p("abc",1);
	mp.insert(p);
	mp["def"]=2;

	//find our access
	cout<<mp["def"]<<nl;
	cout<<mp.at("abc")<<nl;

	//cout<<mp.at("ghi")<<nl;//Not present in map,so it will show no result 
	if(mp.count("abc")>0){
		cout<<"Abc is present"<<nl;
	}

	//erase
	mp.erase("abc");
	cout<<"MAP SIZE : "<<mp.size()<<nl;

	int a[]={1,2,3,3,5,2,1,4,3,6,5,5};
	vector<int>output = removeDuplicates(a,11);
	for (int i = 0; i <output.size(); ++i)
	{
		cout<<output[i]<<nl;
	}

}
