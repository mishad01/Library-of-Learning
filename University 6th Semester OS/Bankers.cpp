#include<bits/stdc++.h>
using namespace std;
#define ll long long
#define nl '\n'

int main() {
	ios_base::sync_with_stdio(0);
	cin.tie(0);


	int n, m;
	n = 5;
	m = 3;
	// Allocation Matrix: alloc[i][j] represents the number of resources of type j currently allocated to process i
	int alloc[5][3] = {
		{ 0, 1, 0 }, // P0
		{ 2, 0, 0 }, // P1
		{ 3, 0, 2 }, // P2
		{ 2, 1, 1 }, // P3
		{ 0, 0, 2 }  // P4
	};


	// MAX Matrix: max[i][j] represents the maximum demand of resources of type j for process i
	int max[5][3] = {
		{ 7, 5, 3 }, // P0
		{ 3, 2, 2 }, // P1
		{ 9, 0, 2 }, // P2
		{ 2, 2, 2 }, // P3
		{ 4, 3, 3 }  // P4
	};

	int avail[3] = {3, 3, 2};

	int need[5][3];
	int f[n]; //This is an array used to keep track of whether a process has finished or not. Each element of the array corresponds to a process.
	int ans[n]; //This is an array used to store the sequence of processes in the order in which they are completed in the Banker's algorithm.
	int ind; //This variable is an index used to keep track of the position in the ans array where the next completed process should be stored.

	for (int i = 0; i < n; i++) {
		f[i] = 0;
	}

	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			need[i][j] = max[i][j] - alloc[i][j];
		}
	}
	for (int k = 0; k < n; k++) {
		for (int i = 0; i < n; i++) {
			if (f[i] == 0) {
				int flag = 0;
				for (int j = 0; j < m; j++) {
					if (need[i][j] > avail[j]) {
						flag = 1;
						break;
					}
				}

				if (flag == 0) {
					ans[ind] = i;
					ind++;
					for (int y = 0; y < m; y++) {
						avail[y] += alloc[i][y];
					}
					f[i] = 1;
				}
			}
		}
	}
	int flag = 1;
	for (int i = 0; i < n; i++) {
		if (f[i] == 0) {
			flag = 0;
			cout << "The given sequence is not safe";
			break;
		}
	}
	if (flag == 1) {
		cout << "Its Safe" << nl;
		for (int i = 0; i < n-1; i++) {
			cout << " P" << ans[i] << " ->";
		}
		cout << " P" << ans[n - 1] << endl;
	}


}
