#include<vector>
#include<algorithm>
#include<queue>
#include<iostream>
using namespace std;
#define max 100
vectot<int>a[max];
int visited[max]={0};
int detination[max];
int parent[max];
void bfs(int source)
{
	queue<int>q;
	visited[source]=1;
	detination[source]=0;
	q.push(source)
	while(!q.empty())
	{
		int node = q.front();
		q.pop();
		for(int i=0;i<a[node].size();i++)
		{
			int next=a[node].i;
			if(visited[next]==0)
			{
				visited[next]=1;
				detination[next]=detination[node]+1;
				q.push(next);
			}
		}
	}

}
int main ()
{
	int nodes;
	int edges;
	cout<<"Enter the number of Nodes: ";
    cin>>nodes;
    cout<<endl<<"Enter the number of Edges: ";
    cin>>edges;
     while(edges!=0)
     {
     	int x,y;
     	cin>>x>>y;
     	a[x].push_back(y);
     	edges--;
     }
     int sourc;
     cin>>sourc;
 }