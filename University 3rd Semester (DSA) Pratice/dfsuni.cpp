#include<bits/stdc++.h>
using namespace std;
#define MAX 100000
vector<int>graph[MAX];
vector<bool>visited;

void dfs(int s){
	//cerr<<s<<" ";
	cout<<s<<" ";
	visited[s]=true;
	//cerr<<graph[1];
	for(int i : graph[s]){
		cerr<<i<<" ";
		if(!visited[i]){
			dfs(i);
		}
	}
}
int main(){
	int node,edge;
	cin>>node>>edge;
	for(int i = 0;i<edge;i++){
		int node1,node2;
		cin>>node1>>node2;
		graph[node1].push_back(node2);
		graph[node2].push_back(node1);
	}

	visited.assign(node+1,false);
	int source;
	cin>>source;

	dfs(source);
	//cerr<<graph[1];
}