#include<iostream>
#include<algorithm>
#include<queue>
#include<vector>
using namespace std;
vector<int> a[1000];
int main ()
{
	int nodes,edges;
	cout<<"Enter Number of Nodes"<<endl;
	cin>>nodes;
	cout<<"Enter Number of Edges"<<endl;
	cin>>nodes;
	while(edges!=0)
	{
		int x,y;
		cin>>x>>y;
		a[x].push_back(y);
		edges--;
	}
	int visited[nodes]={0};
	int distance[nodes];
	int parent[nodes];

	int source;
	cout<<"Enter source"<<endl;
	cin>>source;

	visited[source]=1;
	distance[source]=0;
	parent[source]=-1;

	vectot<int>path;
	queue<int>q;
	q.push(source);
	while(!q.empty())
	{
		int v=q.front();
		q.pop();
		for(int i=0;i<a[v].size();i++)
		{
			int u=G[v][i];
			if(visited[u]==0)
			{
				visited[u]=1;
				q.push(u);
				distance[u]=distance[v]+1;
				parent[u]=v;
			}
		}

	}
	for(int i=0;i<nodes;i++)
	{
		cout<<distance[i]<< " ";
	}
	int des;
	cout<<"Enter Destination"<<endl;
	




}
