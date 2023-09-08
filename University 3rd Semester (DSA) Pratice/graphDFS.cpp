#include<vector>
#include<algorithm>
#include<queue>
#include<iostream>
using namespace std;
#define max 100
vector<int>a[max];
int visited[max]={0};
int distance[max];
void dfs(int source)
{
	visited[source]=1;
	for(int i=0;i<a[source].size();i++)
	{
		int next=a[source][i];
		if(visited[next]==0)
		{
			dfs(next);
		}
	}
}
int main ()
{
	int nodes,edges;
	cout<<"Enter Nodes: "<<endl;
	cin>>nodes;
	cout<<"Enter Edges: "<<endl;
	cin>>edges;
	while(edges!=0)
	{
		int x,y;
		cin>>x>>y;
		a[x].push_back(y);
		edges--;
	}
	dfs(0);
	for(int i=0;i<nodes;i++)
	{
		cout<<visited[i];
	}
}