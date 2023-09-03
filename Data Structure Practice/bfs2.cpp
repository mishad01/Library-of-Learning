#include<vector>
#include<algorithm>
#include<queue>
#include<iostream>
using namespace std;
#define max 100
vector<int>a[max];
int visited[max]={0} ;
int distanc[max],parents[max];

void bfs(int source)
{
	queue<int>q;
	visited[source]=1;
	distanc[source]=0;
	q.push(source);
	while(!q.empty())
	{
		int node =q.front();
		q.pop();
       //HERE NODE MEAN THE INDEX SIZE WE GAVE (0,1   0,2  0.3)
		for(int i=0;i<a[node].size();i++)
		{
			int next=a[node][i];
			if(visited[next]==0)
			{
				visited[next]=1;
				q.push(next);
				distanc[next]=distanc[node]+1;
				parents[next]=node;
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
    cout<<"Enter Source"<<endl;
    cin>>sourc;
    bfs(sourc);
    cout<<"From "<<sourc<<":";
    for (int i=0; i<nodes; i++)
    {
        cout<<distanc[i]<<" ";
    }
    vector<int>path;
    int destination;
    cout<<"Enter Destination"<<endl;
    cin>>destination;

    if(visited[destination]==0)
    {
        cout<<"No Path";
    }
    else
    {
        int x=destination;
        while(x!=-1)
        {
            path.push_back(x);
            x=parents[x];
        }
        reverse(path.begin(),path.end());
    }
    for(int i=0; i<path.size(); i++)
    {
        cout<<path[i]<<" ";
    }
    cout<<endl;
}


