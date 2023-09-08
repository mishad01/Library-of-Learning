#include<bits/stc++.h>
using namespace std;
#define MAX 1000;
vector<int>graph(MAX);
vector<bool>visited;

void bsf(int s){
	queue<int>q;
	q.push(s);
	visited[s]=true;
	cout<<s<<" ";
	while(!q.empty){
		int v = q.front();
		q.pop();
		for(int i : graph(v)){
			if(!visited[i]){
				 0981
			}
		}
	}
}
int main(){
	int n,e;
	cin>>n>>e;
	for(int i = 0;i<e;i++){
		int n1,n2;
		cin>>n1>>n2;
		graph[n1].push_back(n2);
		graph[n2].push_back(n1);
	}

	visited(n+1,false);

	int source;
	cin>>source;
	bfs(source);

}