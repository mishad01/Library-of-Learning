#include<bits/stdc++.h>
using namespace std;
#define ll long long
#define nl '\n'
int main()
{
    int n, bt[20], wt[20], tat[20], avwt = 0, avtat = 0, i, j;

    // Input the total number of processes
    cout << "Enter total number of processes: ";
    cin >> n;

    // Input the burst time for each process
    cout << "\nEnter Process Burst Time\n";
    for (i = 0; i < n; i++)
    {
        cout << "P[" << i + 1 << "]:";
        cin >> bt[i];
    }

    wt[0] = 0;

    // Calculate waiting time for each process
    for (i = 1; i < n; i++)
    {
        wt[i] = 0;
        wt[i] = wt[i - 1] + bt[i - 1];
    }

    // Display the header for the output table
    cout << "\nProcess\t\tBurst Time\tWaiting Time\tTurnaround Time";

    // Calculate turnaround time and display the results
    for (i = 0; i < n; i++)
    {
        tat[i] = bt[i] + wt[i];
        avwt += wt[i];
        avtat += tat[i];
        cout << "\nP[" << i + 1 << "]\t\t" << bt[i] << "\t\t" << wt[i] << "\t\t" << tat[i];
    }

    // Calculate and display average waiting time and average turnaround time
    avwt /= i;
    avtat /= i;
    cout << "\n\nAverage Waiting Time:" << avwt;
    cout << "\nAverage Turnaround Time:" << avtat;

    return 0;
}
