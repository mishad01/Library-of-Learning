#include<iostream>
#include<algorithm>
#include<queue>
#include<vector>
using namespace std;
#define max 1000
vector<int>graph[max];
int visited[max]={0};
int distanc[max],parent[max];
void bfs(int source)
{
	queue<int>q;
	visited[source]=1;
	distanc[source]=0;
	q.push(source);
	while(!q.empty())
	{
		int node=q.front();
		q.pop();
		for(int i=0;i<graph[node].size();i++)
		{
			int next = graph[node][i];
			if(visited[next]==0)
			{
				visited[next]=1;
				distanc[next]=distanc[node]+1;
				q.push(next);
			}

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
		graph[x].push_back(y);
		edges--;
	}
	int sourc;
	cout<<"Enter Source"<<endl;
    cin>>sourc;
    bfs(sourc);
    cout<<"From "<<sourc<<":";
    for (int i=0; i<nodes; i++)
    {
        cout<<distanc[i]<<" ";
    }


}