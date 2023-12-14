#include<bits/stdc++.h>
using namespace std;
#define ll long long
#define nl '\n'
#include <iostream>

using namespace std;

int main()
{
    int bt[20], p[20], wt[20], tat[20], i, j, n, total = 0, temp;
    float avg_wt, avg_tat;

    // Input the number of processes
    cout << "Enter number of processes: ";
    cin >> n;

    // Input burst time for each process and initialize process numbers
    cout << "\nEnter Burst Time:\n";
    for (i = 0; i < n; i++)
    {
        cout << "p" << i + 1 << ":";
        cin >> bt[i];
        p[i] = i + 1;
    }

    // Sorting of burst times using bubble sort
    for (i = 0; i < n - 1; i++)
    {
        for (j = 0; j < n - i - 1; j++)
        {
            if (bt[j] > bt[j + 1])
            {
                // Swap burst times
                temp = bt[j];
                bt[j] = bt[j + 1];
                bt[j + 1] = temp;

                // Swap process numbers
                temp = p[j];
                p[j] = p[j + 1];
                p[j + 1] = temp;
            }
        }
    }

    wt[0] = 0;

    // Calculate waiting time for each process
    for (i = 1; i < n; i++)
    {
        wt[i] = wt[i - 1] + bt[i - 1];
        total += wt[i];
    }

    avg_wt = (float)total / n;
    total = 0;

    // Display the table header
    cout << "\nProcess\t    Burst Time    \tWaiting Time\tTurnaround Time";

    // Calculate turnaround time and display the results
    for (i = 0; i < n; i++)
    {
        tat[i] = bt[i] + wt[i];
        total += tat[i];
        cout << "\np" << p[i] << "\t\t  " << bt[i] << "\t\t    " << wt[i] << "\t\t\t" << tat[i];
    }

    avg_tat = (float)total / n;
    cout << "\n\nAverage Waiting Time=" << avg_wt;
    cout << "\nAverage Turnaround Time=" << avg_tat << endl;

    return 0;
}
