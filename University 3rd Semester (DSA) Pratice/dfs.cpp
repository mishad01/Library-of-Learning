#include<iostream>
#include<algorithm>
#include<vector>
#include<queue>
using namespace std;
#define max 1000

vector<int>a[max];
bool visited[max];
int distance[max];
void dfs(int source)
{
	visited[source]=1;
	for(int i =0;i<a[source].size();i++)
	{
		int nextnode = a[source][i];
		if(visited[nextnode]==0)
		dfs(nextnode);
	}

}
int main()
{
	int nodes,edges;
	cout<<"Enter Nodes"<<endl;
	cin>>nodes;
	cout<<"Enter Edges"<<endl;
	cin>>edges;

	
	while(edges!=0)
	{
		int x,y;
		cin>>x>>y;

		a[x].push_back(y);
		edges--;
	}
	dfs(3);
	
		for(int i=0;i<nodes;i++)
		{
			if(visited[i]==1)
			{
				cout<<"Node "<<i<< " is visited"<<endl;
			}
			else
			{
				cout<<"Node "<<i <<" is not visited"<<endl;
			}
		}
	
}
